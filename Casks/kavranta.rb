cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.13"
  sha256 arm:   "2a085ddbacfecd70f8fb2e5606d8dfc3e7771e4ba7538c3cfbf0193a55704bb8",
         intel: "99de6af838a731539a9b511fc21c875507fa20274894f75d167a9542a61e5fd0"

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
