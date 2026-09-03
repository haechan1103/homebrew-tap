cask "kavranta" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.2"
  sha256 arm:   "1c3b42d27e46ea07d1a05088b3cbb00ed529c224d684acfa96416d9aa5c0a049",
         intel: "d084550d74fef1760b14497c85ee1f1eb3ccee3c5ed45910f36f300449168268"

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
