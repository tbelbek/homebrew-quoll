cask "quoll" do
  version "0.4.0"
  sha256 ""

  url "https://github.com/tbelbek/quoll/releases/download/v#{version}/Quoll-#{version}-macos-universal.zip"
  name "Quoll"
  desc "Instant filename search with a global hotkey"
  homepage "https://github.com/tbelbek/quoll"

  depends_on macos: :ventura

  app "Quoll.app"
  binary "#{appdir}/Quoll.app/Contents/MacOS/quoll-cli", target: "quoll"

  zap trash: [
    "~/Library/Application Support/Quoll",
    "~/Library/Preferences/com.quoll.search.plist",
  ]

  caveats <<~EOS
    Quoll is not notarized. If macOS refuses to open it the first time:
      xattr -dr com.apple.quarantine #{appdir}/Quoll.app
    Then grant Full Disk Access (System Settings > Privacy & Security) so the
    first scan does not stop at every protected folder.
  EOS
end
