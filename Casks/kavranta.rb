cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.3"
  sha256 arm:   "8ff97f3f50d061f6bb1947d7af942550c7011ef96629f6cb6f425ce673628916",
         intel: "c80d1bf5e38da6a6899f763dcbdd6adc8e763b59c925c8f4d4e2d6dc9c0d4dd8"

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
