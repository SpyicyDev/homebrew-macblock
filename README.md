# homebrew-macblock

Homebrew tap for [macblock](https://github.com/SpyicyDev/macblock), a local DNS sinkhole for macOS.

## Install

One-liner:

```bash
brew install SpyicyDev/macblock/macblock
```

Or, using an explicit tap:

```bash
brew tap SpyicyDev/macblock
brew install macblock
```

## Post-install setup

`macblock` needs to install LaunchDaemons and update system DNS.

```bash
sudo macblock install
sudo macblock enable
```

Optional (recommended):

```bash
sudo macblock update
macblock doctor
```

## Uninstall

Remove system integration first, then remove the Homebrew packages:

```bash
sudo macblock uninstall
brew uninstall macblock dnsmasq
```

## Documentation

See the main repository for full documentation and troubleshooting:

- https://github.com/SpyicyDev/macblock
