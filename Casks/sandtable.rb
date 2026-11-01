cask "sandtable" do
  version "1.0.1"
  sha256 "6a938bef6fbf610d9c9f05497811aaea7bd2a2e11a354945e5d24a66b55da295"

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
