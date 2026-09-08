cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.4"
  sha256 arm:   "64167be66c16ca67bb409d2dd686492a7381e3048f038e153b7aa88dda93dfa8",
         intel: "e2c4c0bf0326780425025d2da0360e4f45d69f71d5cfee09af476f52c294c5c9"

  url "https://github.com/haechan1103/kavranta/releases/download/v#{version}/Kavranta_#{version}_#{arch}.dmg"
  name "Kavranta"
  desc "Local-first environment variable manager with secure AI workflows"
  homepage "https://github.com/haechan1103/kavranta"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Kavranta.app"

  zap trash: [
    "~/Library/Application Support/dev.hgc.env-manager",
    "~/Library/Caches/dev.hgc.env-manager",
    "~/Library/Preferences/dev.hgc.env-manager.plist",
  ]
end
