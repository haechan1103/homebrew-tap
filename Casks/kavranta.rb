cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.11"
  sha256 arm:   "cb1a71d15ea49eb64eb06578dd01f1c5a4eb4e0f808689b7c227e5222df6957a",
         intel: "9cb5e05bbaca663cdb3255505d2fe0ec201bcfaa3151174babca1d816599b606"

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
