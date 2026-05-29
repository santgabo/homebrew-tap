# santgabo/homebrew-tap

A [Homebrew tap](https://docs.brew.sh/Taps) for command-line tools published by [santgabo](https://github.com/santgabo). Install formulae with `brew install santgabo/tap/<formula>` without adding the tap explicitly.

## Formulae

| Formula | Description | Source |
|---------|-------------|--------|
| [usbfix](Formula/usbfix.rb) | Inspect, repair, and format USB drives on macOS | [USBfixertool-CLI](https://github.com/santgabo/USBfixertool-CLI) |

## Install

```bash
brew install santgabo/tap/usbfix
```

You can also tap first and install by name:

```bash
brew tap santgabo/tap
brew install usbfix
```

## Update

```bash
brew update && brew upgrade usbfix
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to add new CLI formulae to this tap.
