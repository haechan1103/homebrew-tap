# frozen_string_literal: true

version, arm_sha, intel_sha = ARGV

unless version&.match?(/\A\d+\.\d+\.\d+\z/) &&
       arm_sha&.match?(/\A[0-9a-f]{64}\z/) &&
       intel_sha&.match?(/\A[0-9a-f]{64}\z/)
  warn "Usage: update-kavranta-cask.rb VERSION ARM_SHA256 INTEL_SHA256"
  exit 1
end

path = "Casks/kavranta.rb"
source = File.read(path)
updated = source.sub(/version "[^"]+"/, %(version "#{version}"))
updated.sub!(
  /sha256 arm:\s+"[0-9a-f]{64}",\n\s+intel: "[0-9a-f]{64}"/,
  %(sha256 arm:   "#{arm_sha}",\n         intel: "#{intel_sha}"),
)

if updated == source && !source.include?(%(version "#{version}"))
  warn "Could not update the Kavranta Cask."
  exit 1
end

File.write(path, updated)
