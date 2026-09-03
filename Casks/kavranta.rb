cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.1"
  sha256 arm:   "d969a95d9f1f40b34d45fabfa9b0ba3f853adda5c418d0d92e033643d0e5b256",
         intel: "2c7a653ea9d92300839769d4ac3a08b936cbf8454126eaab8e252dbd70ed020b"

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
