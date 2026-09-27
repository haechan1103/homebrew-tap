cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.14"
  sha256 arm:   "d51d67fb713b269873d198c310a9bb68c2a38ac362047f00c16515ac651709b0",
         intel: "6302139a2410b46be961d5bd0f3daae396256ea712f60d995787cfaa344c63e7"

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
