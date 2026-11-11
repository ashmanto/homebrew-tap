cask "sandtable" do
  version "1.3.0"
  sha256 "95b08dfedf450eb4937720b2f086f5ee88b92881c51d3261796bbb6a53c57b70"

  url "https://github.com/ashmanto/sandtable/releases/download/v#{version}/Sandtable-#{version}-arm64.dmg"
  name "Sandtable"
  desc "Ticket board that runs a Claude Code session per ticket"
  homepage "https://github.com/ashmanto/sandtable"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: ["gh", "tmux"]
  depends_on macos: :ventura

  app "Sandtable.app"

  zap trash: [
    "~/Library/Application Support/sandtable",
    "~/Library/Preferences/com.ashmanto.sandtable.plist",
    "~/Library/Saved Application State/com.ashmanto.sandtable.savedState",
  ]

  caveats <<~EOS
    Sandtable needs Claude Code, signed in. If you don't have it, install it with:
      brew install --cask claude-code

    Sandtable isn't notarized. If macOS refuses to open it, click Open Anyway in
    System Settings > Privacy & Security.
  EOS
end
