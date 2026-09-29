cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.17"
  sha256 arm:   "338ad9a9d8b735afbd8cc08feed3b29209f703ef6b51e36881b4890764d6044e",
         intel: "64ca6c02bf9e1b614ab7b48b374e135615e941388d4d4042ff8c7525048249e7"

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
