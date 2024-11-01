# Neovim

My neovim config along with the rest of my WSL setup.

## Inside WSL

```
sudo apt update && sudo apt upgrade
```

### Automatic install

```sh
git clone --depth 1 https://github.com/mvahaste/nvim.git ~/.config/nvim
chmod +x ~/.config/nvim/install.sh
~/.config/nvim/install.sh
```

After the script finishes close and reopen the terminal.

### Manual install

Just follow [install.sh](/install.sh). [.zshrc](/other/.zshrc) and [tmux.conf](/other/tmux.conf) are in the `other/` directory.  

## WSL Profile

When opening a WSL terminal window, connect to `main` session, or create it if it doesn't exist.

```
# Command line
C:\WINDOWS\system32\wsl.exe -d Ubuntu -e sh -c "tmux attach -t main || tmux new -s main"
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
