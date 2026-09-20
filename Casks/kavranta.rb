cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.10"
  sha256 arm:   "bb0915ccf204c1ee69c5a22bb5bd80c8424d169c4f722f9a2dab183c61293fa3",
         intel: "e430851cc76d5fa636278788876db5364b33899d19892bed4f9a1175cb9ba241"

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
