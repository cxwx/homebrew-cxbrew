# Cxwx Cxbrew

[![CI](https://github.com/cxwx/homebrew-cxbrew/actions/workflows/tests.yml/badge.svg)](https://github.com/cxwx/homebrew-cxbrew/actions/workflows/tests.yml)

A personal Homebrew tap providing formulae for scientific computing, C++ libraries, and developer tools. Fully tested on Apple Silicon (M1).

> This project was developed with the assistance of the **Xiaomi MiMo model** (mimo-v2.5-pro), an AI coding assistant that helped write, refactor, and maintain the formula definitions.

## Installation

```sh
brew tap cxwx/cxbrew
```

Then install any formula from this tap:

```sh
brew install cxwx/cxbrew/<formula>
```

For example:

```sh
brew install cxwx/cxbrew/highfive
brew install cxwx/cxbrew/bilibili-tui
brew install cxwx/cxbrew/rime-ls
```

## Available Formulae

Formulae are organized by language under `Formula/`:

- **`cpp/`** - C++ libraries (scientific computing, JSON, linear algebra, CLI tools, etc.)
- **`go/`** - Go developer tools
- **`rust/`** - Rust tools
- **`c/`** - C libraries

Browse the [`Formula/`](Formula/) directory for the full list. Formulae may be added or removed over time.

## CI

Formulas are automatically validated on push to `master` via GitHub Actions, checking Ruby syntax for all `.rb` files under `Formula/`. Separate workflows run for macOS 13, 14, and 15.

## Known Limitations

- Most formulae lack `license` and `test` blocks (see [TODO](doc/todo.org) for progress)
- Primarily maintained for personal use; PRs and issues are welcome

## Contributing

PRs and issues are welcome. Please ensure your formula passes `ruby -c` syntax check before submitting.

## Acknowledgements

This project was written and maintained with the help of the **Xiaomi MiMo model** (`mimo-v2.5-pro`), Xiaomi's AI coding model. Formula definitions, refactoring, CI configuration, and documentation were all assisted by MiMo, demonstrating the capability of large language models in maintaining infrastructure-as-code projects like Homebrew taps.
