cask "manyhands" do
  version "0.2.1"
  sha256 "4e9afaf1ebd8a8b625bbcfe102bcde7b6e8af956a40f31375b56d9a38e5be231"

  url "https://github.com/vhodges/manyhands/releases/download/v#{version}/manyhands-v#{version}-aarch64-apple-darwin.zip"
  name "Manyhands"
  desc "Local-first, Git-backed project management and documentation"
  homepage "https://github.com/vhodges/manyhands"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "manyhands-v#{version}-aarch64-apple-darwin/Manyhands.app"
  binary "manyhands-v#{version}-aarch64-apple-darwin/bin/manyhands-cli"

  caveats <<~EOS
    This personal-tap build is ad-hoc signed, not Developer ID signed or notarized.
    macOS quarantines it and blocks it until you approve it. Only do this if you
    trust the build.

    The CLI loads libraries from lib/ beside bin/, and each file needs approval
    too, or it fails with "Library load disallowed by system policy". Clear the
    whole install in one step:
      xattr -dr com.apple.quarantine "#{staged_path}"

    The app: open it once, then choose "Open Anyway" under System Settings,
    Privacy & Security. This needs an administrator.

    Do not move the CLI out of that layout. Uninstall preserves your user data.
  EOS
end
