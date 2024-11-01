# Neovim

My neovim config along with the rest of my WSL setup.

## WSL Profile

When opening a WSL terminal window, connect to `main` session, or create it if it doesn't exist.

```
# Command line
C:\WINDOWS\system32\wsl.exe -d Ubuntu -e sh -c "tmux attach -t main || tmux new -s main"
```

## Update Ubuntu

```
sudo apt update && sudo apt upgrade
```

## zsh, fzf & zoxide

```sh
# zsh
sudo apt install zsh build-essential
chsh mvahaste

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh


# other dependencies
sudo apt install build-essential unzip ripgrep gh
```

```sh
# .zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add to path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"

# Set zinit and plugins directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it doesn't exist
if [ ! -d "$ZINIT_HOME" ]; then
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"

# Aliases
alias ls="ls --color"
alias n="nvim"

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd zsh)"
```

## tmux & tpm

```sh
sudo apt install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

```conf
# ~/.config/tmux/tmux.conf

# Fix tmux colors for Windows Terminal
set -g default-terminal "screen-256color"
set-option -sa terminal-overrides ",xterm-256color:RGB"

# Enable mouse support
set -g mouse on

# Start windows and panes at 1
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

# Set prefix
unbind C-b
set -g prefix C-space
bind C-space send-prefix

# Set vi mode
set-window-option -g mode-keys vi

# Copy with v and y
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

# Shift+Alt+[H, L] to switch windows
bind -n M-H previous-window
bind -n M-L next-window

# Open panes in current directory
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

# Install plugins
set -g @plugin "tmux-plugins/tpm"
set -g @plugin "tmux-plugins/tmux-sensible"
set -g @plugin "tmux-plugins/tmux-yank"
set -g @plugin "christoomey/vim-tmux-navigator"
set -g @plugin "niksingh710/minimal-tmux-status"

# Configure minimal-tmux-status
set -g @minimal-tmux-use-arrow true
set -g @minimal-tmux-right-arrow ""
set -g @minimal-tmux-left-arrow ""

run "~/.tmux/plugins/tpm/tpm"
```

## nvim

```sh
# neovim and my config
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
git clone --depth 1 https://github.com/mvahaste/nvim.git ~/.config/nvim

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## Windows Terminal

Simple theme for the terminal.

```json
{
  "name": "X Dotshare",
  "background": "#151515",
  "black": "#101010",
  "blue": "#7DC1CF",
  "brightBlack": "#404040",
  "brightBlue": "#4E9FB1",
  "brightCyan": "#42717B",
  "brightGreen": "#A0CF5D",
  "brightPurple": "#8542FF",
  "brightRed": "#D23D3D",
  "brightWhite": "#DDDDDD",
  "brightYellow": "#F39D21",
  "cursorColor": "#FFFFFF",
  "cyan": "#6D878D",
  "foreground": "#D7D0C7",
  "green": "#B8D68C",
  "purple": "#9B64FB",
  "red": "#E84F4F",
  "selectionBackground": "#FFFFFF",
  "white": "#DDDDDD",
  "yellow": "#E1AA5D"
}
```
