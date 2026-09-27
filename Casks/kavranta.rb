cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.15"
  sha256 arm:   "0e7cff5d93251bc122fbed8cac1b261c8fc5747380249e61fca01dabff4c4a8e",
         intel: "24690da93127f74eede52504a8fc7653e7472529c6647afddf28fccab33dc00a"

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
