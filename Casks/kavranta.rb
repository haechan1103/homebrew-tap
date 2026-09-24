cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.12"
  sha256 arm:   "641086f7bd6103547237783dae7464f316cad1c0d22eadc6f4d0a9fda10c1b85",
         intel: "8df2f000a0922aa11f7bcc514bb38b860c07c69f313216e40b3c06a085aab69b"

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
