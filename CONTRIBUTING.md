# Contributing

Gracias por ayudar a mantener este Homebrew tap. Cada formula vive en `Formula/` y debe seguir el patron de [usbfix](Formula/usbfix.rb): binarios precompilados para macOS publicados como assets de GitHub Releases.

## Agregar una formula nueva

1. **Publica un release en GitHub** para tu CLI con un tarball por arquitectura, por ejemplo `darwin_arm64` y `darwin_amd64`.

2. **Crea** `Formula/<name>.rb`.

   Usa el nombre del archivo en minusculas. La clase de Ruby debe ir en PascalCase, por ejemplo `mytool.rb` usa `class Mytool`.

3. **Calcula los SHA256** de cada asset del release:

   ```bash
   curl -L "<release-tarball-url>" | shasum -a 256
   ```

4. **Valida localmente** antes de abrir un pull request:

   ```bash
   brew tap santgabo/tap "$(pwd)"
   brew audit --strict <name>
   brew install santgabo/tap/<name>
   brew test <name>
   ```

   Homebrew 5.1+ ya no acepta `brew audit` por ruta ni `brew install --formula`; primero agrega el tap local y luego usa el nombre de la formula.

5. **Actualiza** la tabla de formulas en [README.md](README.md).

## Plantilla de formula

Copia esta plantilla y reemplaza los placeholders (`ToolName`, `version`, URLs, SHA256s, `binary_name`, `test_command`):

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

Ajusta `test` para que coincida con la salida real del binario, por ejemplo `version` o `--help`.

## Convenciones

- **Un archivo por CLI** dentro de `Formula/`.
- **Metadata obligatoria:** `desc`, `homepage`, `version` y `license`.
- **Tests obligatorios:** cada formula necesita un bloque `test do`; Homebrew lo exige para taps.
- **Sin conflictos de nombre:** revisa [homebrew/core](https://github.com/Homebrew/homebrew-core) y usa un nombre distinto si podria chocar con una formula existente.
- **Instalacion agnostica:** documenta siempre la forma general `brew install santgabo/tap/<formula>` y luego, si aplica, ejemplos especificos.

## CI

Pull requests y pushes a `main` ejecutan `brew audit --strict`, instalan cada formula y corren `brew test` en macOS. Corrige cualquier falla antes de mezclar cambios.
