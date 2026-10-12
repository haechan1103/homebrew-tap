cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.19"
  sha256 arm:   "bc5b40f79f7a9c37dc5db910610298114e7b9517b673612120cad66a05e5cc15",
         intel: "4c28fe5505ca212d3c080f7821fe43b358443b8dc20221519705652c6ec94ded"

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
