cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.5"
  sha256 arm:   "15e7e8d1da18c9626a562ccb6d3ef183cf090074ed5a961061802bc7ad3b596c",
         intel: "db55602287b3895c37038c530f22c2b6cf4071401b190ead95fd340a4ca2283c"

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
