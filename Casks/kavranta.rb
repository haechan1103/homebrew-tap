cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.8"
  sha256 arm:   "0ce438938a9c231db907a211d4b9dda2a90707b6c28e7e9723586b89e8cd3806",
         intel: "b155349522ecb5be38bb60a926b4489f048117479d206dd6349d425a34cd1ad7"

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
