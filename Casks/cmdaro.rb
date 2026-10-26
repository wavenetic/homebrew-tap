cask "cmdaro" do
  version "0.8.5"
  sha256 "4ea44b05043b28287d798de56c16b5e443b8f51c93ea094cbd004f19e0f46d72"

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
