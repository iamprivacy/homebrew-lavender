# Homebrew cask for Lavender. Rendered by .github/workflows/homebrew.yml from
# packaging/homebrew/lavender.rb.in in the Lavender repo and pushed to the tap
# (iamprivacy/homebrew-lavender) when a release is published; edit the
# template, not the tap's copy.
cask "lavender" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "f05631f198d583da2c806a077e3a4e3dd6a1e637c0f45d5ebd65c49c79ba8825",
         intel: "11494d51014206de402b7cec293f0b8415424db33b8eaa152ce1b0bfcbd63c7e"

  url "https://github.com/iamprivacy/Lavender/releases/download/v#{version}/Lavender_#{version}_#{arch}.dmg"
  name "Lavender"
  desc "Synced lyrics downloader with an offline LRCLIB database source"
  homepage "https://github.com/iamprivacy/Lavender"

  livecheck do
    url :url
    strategy :github_latest
  end

  # No auto_updates: the in-app update is off until the user turns it on, so a
  # plain `brew upgrade` has to update Lavender.
  depends_on :macos

  app "Lavender.app"

  zap trash: [
    "~/Library/Application Support/io.github.iamprivacy.lrclocalget",
    "~/Library/Caches/io.github.iamprivacy.lrclocalget",
    "~/Library/Logs/io.github.iamprivacy.lrclocalget",
    "~/Library/Preferences/io.github.iamprivacy.lrclocalget.plist",
    "~/Library/Saved Application State/io.github.iamprivacy.lrclocalget.savedState",
    "~/Library/WebKit/io.github.iamprivacy.lrclocalget",
  ]

  caveats <<~EOS
    Lavender is not code signed yet. The first time you open it, macOS may
    block it: click Open Anyway in System Settings > Privacy & Security.
  EOS
end
