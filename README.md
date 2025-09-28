

# Neovim Config

Welcome to my personal Neovim configuration! This repo is designed for users who want a modern, extensible, and fast development environment powered by [Neovim](https://neovim.io/) and Lua.

## Features

- **Written in Lua**: Fast, readable, and leverages Neovim’s latest features.
- **Modular Structure**: Easy to customize, with plugin configurations separated in `lua/plugins/`.
- **Modern Plugins**: Includes support for LSP, syntax highlighting, and more.
- **Custom Keybindings**: Streamlined workflow for coding efficiency.
- **Personal Tweaks**: My own options and preferences for editing.

## Installation

### Prerequisites

- [Neovim](https://neovim.io/) v0.5.0 or newer
- [git](https://git-scm.com/)

### Setup

```bash
git clone https://github.com/lmckenzie99/nvim-config.git ~/.config/nvim
```

Then launch Neovim:

```bash
nvim
```

Plugins will install automatically if managed by a plugin manager.

## Configuration Structure

- **`init.lua`**: Entry point for Neovim config (if present).
- **`lua/vim-options.lua`**: General editor options and settings.
- **`lua/plugins/`**: Modular plugin configuration files.

## Plugins

Plugin configurations are stored in [`lua/plugins`](https://github.com/lmckenzie99/nvim-config/tree/main/lua/plugins). Notable plugins (edit as needed):

- **LSP Support**: Language Server Protocol for smart completion and navigation.
- **Syntax Highlighting**: Enhanced with Treesitter or similar.
- **File Explorer**: Navigate files efficiently.
- **Status Line**: Modern status/tab line plugin.
- **Fuzzy Finder**: Fast navigation with telescope-like plugins.

## Customization

You can tweak settings by editing files in the `lua/` directory, or add plugins in `lua/plugins/`.

## Contributing

This is a personal config, but feel free to fork and adapt for your own use!

## Licensing

Most plugins in this config are covered under MIT licensing. Check each plugin if needed! Feel free to use the project as a whole as starting point or a finished product.

---

**Clone, customize, and enjoy coding with Neovim!**
