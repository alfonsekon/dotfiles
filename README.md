# dotfiles

Messiest and most vanilla dotfiles known to man, a forever work in progress.\
Most of the aliases in `.bashrc` are because I am **lazy**  Do **not** be like me.\
I've moved some scripts to `$HOME/personal/scripts` on my machine, but they can be found [here](./scripts/scripts/).

Currently trying to clean up each file to make finding stuff and editing easier.\
I'm still finding my way around keybinds and stuff... currently exploring the keyboard layout/layers rabbit hole

## Installation 

To install a config to your _$HOME_ directory, make sure to have [stow](https://savannah.gnu.org/git/?group=stow) installed and run
```bash
stow -v -t $HOME <package-name>
```
where `<package-name>` is anything **but** `keyd` and `tlp`, as they need to be placed outside of the home directory. 

To install `keyd`, run 
```bash
stow -v -t /etc/keyd keyd
```

To install `tlp`, run 
```bash
stow -v -t /etc tlp
```
In general, `stow` will install at the specified directory you place. For example,
```bash
stow -v -t $HOME/personal ideavim
```
will install `.ideavimrc` in _$HOME/personal_ (_$HOME/personal/.ideavimrc_)

## Uninstallation

To uninstall any _stow_-ed directory, simply run 
```bash
stow -D <package-name>
```

## stuff
- **OS** → `Pop!_OS 22.04 LTS`

- **Shell** → `bash`

- **Editor configs** → NeoVim [`nvim/.config/nvim/init.lua`](./nvim/.config/nvim/init.lua) (forked from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)), [VS Code](./vscode/.config/Code/User/)/[VSCodium](./vscodium/.config/VSCodium/User/) `settings.json` and `keybindings.json`, [Android Studio](./ideavim/) `.ideavimrc` (*very* rarely used)

- **Window manager setup** → [`i3/.config/i3/config`](./i3/.config/i3/config), [`./picom/.config/picom.conf`](./picom/.config/picom.conf)

- **Terminal (Wezterm) config** → [`wezterm/.config/wezterm/wezterm.lua`](./wezterm/.config/wezterm/wezterm.lua), `scripts/wezterm_sessionizer_ide.sh`, `scripts/wezterm_sessionizer_vim.sh` (tried doing something like [ThePrimeagen's tmux sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer))

- **Browser** → [Vivaldi Browser](https://vivaldi.com/download/) and keybindings in [browser-keybinds.md](./browser-keybinds.md)

- **Theme** → currently using a [custom prompt](./oh-my-posh/.config/oh-my-posh/luis.omp.json) using `oh-my-posh`, [gruvbox](https://github.com/morhetz/gruvbox) for the terminal and code editor theme/color scheme 

## Dependencies
- [`stow`](https://savannah.gnu.org/git/?group=stow) to install configs
- [`i3`](https://i3wm.org/)
- [`picom`](https://github.com/yshui/picom)
- [`wezterm`](https://wezterm.org/index.html) (stable version)
- [`bash`](https://www.gnu.org/software/bash/)
- [`grep`](https://www.gnu.org/software/grep/)
- [`fzf`](https://github.com/junegunn/fzf) 
- [`eza`](https://github.com/eza-community/eza) for terminal icons
- [`keyd`](https://github.com/rvaiya/keyd) for software level keymapping (disabled when using split keyboard)
- [`libinput-gestures`](https://github.com/bulletmark/libinput-gestures) for touchpad gestures
- [`zoxide`](https://github.com/ajeetdsouza/zoxide)
- [`oh-my-posh`](https://ohmyposh.dev/docs/installation/linux)
- [`nvim`](https://neovim.io/) with [`kickstart.nvim`](https://github.com/nvim-lua/kickstart.nvim)
<br></br>
- [`VS Code`](https://code.visualstudio.com/)
- [`VSCodium`](https://github.com/VSCodium/vscodium)
settings for both VS Code and VSCodium should match, but as of now (Jan 20, 2026), i am using VSCodium so that should be the more updated one
<br></br>
<br></br>
i don't do much android, if at all but i just keep android studio in case
- [`Android Studio`](https://developer.android.com/studio)
