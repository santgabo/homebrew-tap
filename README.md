# santgabo/homebrew-tap 🍺

Homebrew tap para herramientas de linea de comandos publicadas por [santgabo](https://github.com/santgabo). Instala cualquier formula del tap sin agregarlo antes de forma explicita:

```bash
brew install santgabo/tap/<formula>
```

Tambien puedes agregar el tap una sola vez y luego instalar formulas por nombre:

```bash
brew tap santgabo/tap
brew install <formula>
```

## Formulae 🧰

| Formula | Description | Source |
|---------|-------------|--------|
| [usbfix](Formula/usbfix.rb) | Inspect, repair, and format USB drives on macOS | [USBfixertool-CLI](https://github.com/santgabo/USBfixertool-CLI) |

## Instalar usbfix 🔌

Instalacion directa:

```bash
brew install santgabo/tap/usbfix
```

Si ya agregaste el tap:

```bash
brew install usbfix
```

## Actualizar ⬆️

```bash
brew update
brew upgrade usbfix
```

## Troubleshooting

Si `brew upgrade` no actualiza el binario (sigue la version anterior), reinstala desde cero:

```bash
brew uninstall usbfix
brew untap santgabo/tap
brew tap santgabo/tap
brew install santgabo/tap/usbfix
```

Para otra formula del tap, sustituye `usbfix` por su nombre.

## Contribuir 🤝

Lee [CONTRIBUTING.md](CONTRIBUTING.md) para agregar o mantener nuevas formulas en este tap.
