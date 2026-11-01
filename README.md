# Homebrew tap

Homebrew casks for [Sandtable](https://github.com/ashmanto/sandtable).

## Install Sandtable

```bash
brew tap ashmanto/tap
brew trust ashmanto/tap
brew install --cask sandtable
```

Homebrew installs casks only from taps you trust, which is what `brew trust` does. The cask also
installs `gh` and `tmux`. Sandtable needs Claude Code as well, which you can install with
`brew install --cask claude-code`.
