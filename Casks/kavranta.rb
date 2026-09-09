cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.6"
  sha256 arm:   "879a2878424664e2575114af36f1c5819f7ba6dfbd550f0a02f10e752cc51ffd",
         intel: "22cd96ba8bc2fd8c043f1e7eb3eb170c6b087b4ca2ccc3be5d039197fe3a7edd"

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
