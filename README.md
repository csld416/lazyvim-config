# LazyVim Config Build Guide

This guide documents how to use this LazyVim configuration on an Ubuntu 20.04 machine.

The important constraint is Neovim version compatibility. LazyVim requires a modern Neovim release, but Ubuntu 20.04 ships an old `apt` package and the current official Neovim Linux binary may not run because it requires a newer `glibc`.

## Requirements

- Ubuntu 20.04 or similar Linux environment
- `git`
- `curl`
- `make`
- `cmake`
- `gettext`
- `pkg-config`
- `ninja-build`
- Neovim `0.11.2` or newer

Check the current Neovim version:

```bash
nvim --version
```

If the version is older than `0.11.2`, upgrade Neovim before installing this config.

## Why not use the official Neovim tarball?

On Ubuntu 20.04, the official Neovim tarball may fail with an error like:

```text
nvim: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found
nvim: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found
nvim: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found
```

That means the downloaded binary was built against a newer `glibc` than the OS provides.

Do not upgrade `glibc` system-wide just for Neovim. Build Neovim locally instead.

## Install build dependencies

```bash
sudo apt update
sudo apt install -y git curl make cmake gettext pkg-config ninja-build
```

## Build and install Neovim locally

Install Neovim into `~/.local`:

```bash
mkdir -p ~/.local/opt
cd ~/.local/opt

git clone https://github.com/neovim/neovim nvim-src
cd nvim-src
git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX="$HOME/.local"
make install
```

Make sure `~/.local/bin` is before `/usr/bin` in `PATH`. Add this to `~/.bashrc` if it is not already present:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Reload the shell:

```bash
source ~/.bashrc
hash -r
```

Verify the installed version:

```bash
nvim --version
```

Expected result:

```text
NVIM v0.11.2
```

or newer.

## Install this LazyVim config

Clone this repository as a separate Neovim app config:

```bash
git clone https://github.com/csld416/lazyvim-config ~/.config/nvim-lazyvim
```

Using a separate config directory keeps this setup independent from `~/.config/nvim`.

## Add a `lazyvim` command

Add this function to `~/.bashrc`:

```bash
lazyvim() {
  NVIM_APPNAME=nvim-lazyvim nvim "$@"
}
```

Reload the shell:

```bash
source ~/.bashrc
```

Launch LazyVim:

```bash
lazyvim
```

The first launch will install plugins through `lazy.nvim`.

## Optional external tools

Some features in this config depend on language tools or formatters that may not be installed by default.

Useful optional tools include:

- `clangd` for C/C++
- Python tooling for Python LSP support
- Haskell tooling for Haskell LSP support
- TeX tools such as `pdflatex` / `latexmk`
- `verible-verilog-ls` for Verilog/SystemVerilog
- `ripgrep` and `fd` for Telescope search

Install only the tools needed for the languages you use.

## Linux path adjustment

This config currently contains a macOS-specific runner path in `lua/config/keymaps.lua`:

```lua
/Users/csld/selfScript/run
```

On Linux, update that path before using the `<leader>rv` or `<leader>rh` run-file keymaps.

For example:

```lua
vim.cmd("terminal /home/csld/selfScript/run " .. vim.fn.shellescape(file))
```

If that script does not exist on the Linux machine, either create it or remove those keymaps.

## Updating

Update the config:

```bash
cd ~/.config/nvim-lazyvim
git pull
```

Update Neovim source later:

```bash
cd ~/.local/opt/nvim-src
git fetch --tags
git checkout stable
git pull
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX="$HOME/.local"
make install
```

Then verify:

```bash
nvim --version
```
