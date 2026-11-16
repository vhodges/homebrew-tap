cask "manyhands" do
  version "0.2.0-rc.1"
  sha256 "f6154e498daada3ca2bbb08e39306c55de3308891a472334e7eb2bd4b54a601a"

  url "https://github.com/vhodges/manyhands/releases/download/v#{version}/manyhands-v#{version}-aarch64-apple-darwin.zip"
  name "Manyhands"
  desc "Local-first, Git-backed project management and documentation"
  homepage "https://github.com/vhodges/manyhands"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "manyhands-v#{version}-aarch64-apple-darwin/Manyhands.app"
  binary "manyhands-v#{version}-aarch64-apple-darwin/bin/manyhands-cli"

  caveats <<~EOS
    This personal-tap build is ad-hoc signed, not Developer ID signed or notarized.
    macOS may block opening it; use macOS's normal approval flow if you trust it.
    The CLI's libraries and disclosures remain in the Caskroom beside bin/.
    Do not move the CLI out of that layout. Uninstall preserves your user data.
  EOS
end
