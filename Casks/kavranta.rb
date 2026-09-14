cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.7"
  sha256 arm:   "38209c6b07d646712cc1fabe374944a650564464555f6deae76fcb3c05ee8891",
         intel: "0e6536e78fd0b75d006e01391f59c3f0b76e688cf43b2b28c5d8f12fe7923eb3"

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
