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
  "background": "#000000",
  "black": "#1B1B1B",
  "blue": "#458588",
  "brightBlack": "#928374",
  "brightBlue": "#83A598",
  "brightCyan": "#8EC07C",
  "brightGreen": "#B8BB26",
  "brightPurple": "#D3869B",
  "brightRed": "#FB4934",
  "brightWhite": "#EBDBB2",
  "brightYellow": "#FABD2F",
  "cursorColor": "#EBDBB2",
  "cyan": "#689D6A",
  "foreground": "#EBDBB2",
  "green": "#98971A",
  "name": "GruvboxDarkHard",
  "purple": "#B16286",
  "red": "#CC241D",
  "selectionBackground": "#665C54",
  "white": "#A89984",
  "yellow": "#D79921"
}
```
