#!/usr/bin/env bash

set -euo pipefail

readonly source_repository="haechan1103/kavranta"
readonly cask_path="Casks/kavranta.rb"

release_json="$(gh api "repos/${source_repository}/releases/latest")"
tag_name="$(jq -er '.tag_name' <<<"${release_json}")"
version="${tag_name#v}"

if [[ ! "${version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Latest release tag is not a stable semantic version." >&2
  exit 1
fi

if [[ "$(jq -er '.immutable' <<<"${release_json}")" != "true" ]]; then
  echo "Latest release is not immutable; refusing to update the Cask." >&2
  exit 1
fi

current_version="$(ruby -ne 'puts $1 if $_ =~ /^  version "([^"]+)"/' "${cask_path}")"
if [[ "${current_version}" == "${version}" ]]; then
  echo "Kavranta Cask is already synchronized with v${version}."
  exit 0
fi

arm_name="Kavranta_${version}_aarch64.dmg"
intel_name="Kavranta_${version}_x64.dmg"
arm_url="$(jq -er --arg name "${arm_name}" '.assets[] | select(.name == $name) | .browser_download_url' <<<"${release_json}")"
intel_url="$(jq -er --arg name "${intel_name}" '.assets[] | select(.name == $name) | .browser_download_url' <<<"${release_json}")"

download_dir="$(mktemp -d)"
trap 'rm -rf "${download_dir}"' EXIT

curl --fail --location --retry 3 --silent --show-error "${arm_url}" --output "${download_dir}/${arm_name}"
curl --fail --location --retry 3 --silent --show-error "${intel_url}" --output "${download_dir}/${intel_name}"

gh attestation verify "${download_dir}/${arm_name}" --repo "${source_repository}" >/dev/null
gh attestation verify "${download_dir}/${intel_name}" --repo "${source_repository}" >/dev/null

arm_sha="$(shasum -a 256 "${download_dir}/${arm_name}" | awk '{print $1}')"
intel_sha="$(shasum -a 256 "${download_dir}/${intel_name}" | awk '{print $1}')"

ruby scripts/update-kavranta-cask.rb "${version}" "${arm_sha}" "${intel_sha}"

echo "Kavranta Cask is synchronized with v${version}."
