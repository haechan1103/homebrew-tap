cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.20"
  sha256 arm:   "be5d807d4e64a8ce69c50a4a467fe3bf047fc29c5519d72f22fa9faa024c0d2e",
         intel: "acf2614c31a6d0f0300ef6ad19754bf9806b831b85d1f388b3d31845e70daf32"

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
