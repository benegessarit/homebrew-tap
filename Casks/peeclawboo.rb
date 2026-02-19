cask "peeclawboo" do
  version "0.1.0"
  sha256 "1bde2125d2ff2a7649e8d9f83398e44e070df6257b8fde04b2e1c13b2096bf8d"

  url "https://github.com/benegessarit/peeclawboo/releases/download/v0.1.0/Peeclawboo.app.zip"
  name "Peeclawboo"
  desc "macOS screenshot daemon that analyzes your activity"
  homepage "https://github.com/benegessarit/peeclawboo"

  app "Peeclawboo.app"
  binary "#{appdir}/Peeclawboo.app/Contents/MacOS/peeclawboo"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Peeclawboo.app"]
  end

  uninstall launchctl: "com.davidbeyer.peeclawboo",
            quit: "com.davidbeyer.peeclawboo"

  zap trash: "~/.peeclawboo"
end
