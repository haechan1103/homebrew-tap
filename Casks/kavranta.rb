cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.9"
  sha256 arm:   "7731bb5283ccb3dba7a2eede24decac0fae6207e2a7d2c9bde67cbcae1a3ad89",
         intel: "d074eb1536d7002d50f76f6d0ceb4d696d0e7b26b77021c43b7e7215998439de"

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
