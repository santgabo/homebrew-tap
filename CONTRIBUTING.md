# Contributing

Thank you for adding CLI tools to this tap. Each formula lives in `Formula/` and follows the same pattern as [usbfix](Formula/usbfix.rb): prebuilt macOS binaries from GitHub releases.

## Adding a new formula

1. **Publish a GitHub release** for your CLI with tarballs per architecture (for example `darwin_arm64` and `darwin_amd64`).

2. **Create** `Formula/<name>.rb` (lowercase filename; Ruby class in PascalCase, e.g. `mytool.rb` → `class Mytool`).

3. **Get SHA256 checksums** for each release asset:

   ```bash
   curl -L "<release-tarball-url>" | shasum -a 256
   ```

4. **Validate locally** before opening a pull request:

   ```bash
   brew tap santgabo/tap "$(pwd)"
   brew audit --strict <name>
   brew install santgabo/tap/<name>
   brew test <name>
   ```

   Homebrew 5.1+ no longer accepts path-based `brew audit` or `brew install --formula`; tap the repo first, then use the formula name.

5. **Update** the formulae table in [README.md](README.md).

## Formula template

Copy and replace placeholders (`ToolName`, `version`, URLs, SHA256s, `binary_name`, `test_command`):

```ruby
class ToolName < Formula
  desc "Short one-line description of the CLI"
  homepage "https://github.com/your-org/your-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/your-org/your-cli/releases/download/v#{version}/yourcli_#{version}_darwin_arm64.tar.gz"
      sha256 "REPLACE_WITH_ARM64_SHA256"
    end

    on_intel do
      url "https://github.com/your-org/your-cli/releases/download/v#{version}/yourcli_#{version}_darwin_amd64.tar.gz"
      sha256 "REPLACE_WITH_AMD64_SHA256"
    end
  end

  def install
    bin.install "binary_name"
  end

  test do
    assert_match "expected output", shell_output("#{bin}/binary_name test_command")
  end
end
```

Adjust `test` to match what your binary actually prints (for example `version` or `--help`).

## Conventions

- **One file per CLI** in `Formula/`.
- **Required metadata:** `desc`, `homepage`, `version`, and `license` must be present.
- **Tests are required:** every formula needs a `test do` block; Homebrew enforces this for taps.
- **Avoid name conflicts** with formulae in [homebrew/core](https://github.com/Homebrew/homebrew-core); pick a distinct name if your tool might collide.

## CI

Pull requests and pushes to `main` run `brew audit --strict`, install each formula, and run `brew test` on macOS. Fix any failures before merging.
