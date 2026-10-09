cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.18"
  sha256 arm:   "63c735c0900428fd1b38f4aa7f7eb606168d9e21fcdc1d579b1788458abf252f",
         intel: "d96d56342da5e5e4d073d08d49519a7df887ff22690049a96e8a91f06e0d8965"

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
