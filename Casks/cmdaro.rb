cask "cmdaro" do
  version "0.9.0"
  sha256 "e8e53c78652e70d5b83780479eda16d3d4a4116c30da2088bd21d8d9a1a06263"

  url "https://updates.cmdaro.com/download/Cmdaro-#{version}.dmg"
  name "Cmdaro"
  desc "Dual-pane file manager"
  homepage "https://cmdaro.com/"

  livecheck do
    url "https://updates.cmdaro.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Cmdaro.app"
  binary "#{appdir}/Cmdaro.app/Contents/Helpers/cmdo"
  binary "#{appdir}/Cmdaro.app/Contents/Helpers/cmdo", target: "cmdaro"

  uninstall quit: "de.wavenetic.cmdaro"

  zap trash: [
    "~/Library/Application Support/Cmdaro/terminal",
    "~/Library/Caches/de.wavenetic.cmdaro",
    "~/Library/HTTPStorages/de.wavenetic.cmdaro",
    "~/Library/Preferences/de.wavenetic.cmdaro.plist",
    "~/Library/Saved Application State/de.wavenetic.cmdaro.savedState",
    "~/Library/WebKit/de.wavenetic.cmdaro",
  ]

  caveats <<~EOS
    Kommandant.app bleibt liegen; Cmdaro übernimmt beim ersten Start Tastenbelegung, eigene Grammatiken und SFTP-Profile.
    Kommandant.app stays in place; on first launch Cmdaro copies the key bindings, custom grammars and SFTP profiles.
  EOS
end
