# Homebrew Tap for Kavranta

Install the latest notarized macOS release of
[Kavranta](https://github.com/haechan1103/kavranta):

```bash
brew install --cask haechan1103/tap/kavranta
```

Upgrade:

```bash
brew upgrade --cask haechan1103/tap/kavranta
```

Uninstall the app while keeping its local data:

```bash
brew uninstall --cask kavranta
```

Remove the app and its Kavranta preferences and application data:

```bash
brew uninstall --cask --zap kavranta
```

The Cask supports Apple Silicon and Intel Macs. Its update workflow accepts only the
latest stable, immutable GitHub Release, verifies GitHub artifact attestations for
both DMGs, and records their exact SHA-256 checksums before updating the Cask.
