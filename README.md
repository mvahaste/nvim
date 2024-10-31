# Neovim

My neovim config (based on [NvChad](https://nvchad.com/)) and some WSL stuff.

## WSL

### Oh My Posh & Zoxide

I use [Oh My Posh](https://ohmyposh.dev/) for the prompt and [Zoxide](https://github.com/ajeetdsouza/zoxide) as a replacement for the `cd` command.

```bash
# Use Oh My Posh
eval "$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/pure.omp.json) $(zoxide init bash --cmd cd)"
```

### Windows Terminal

Simple theme with a black background since I use transparency with blur.

```json
{
  "name": "X Dotshare",
  "background": "#000000",
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

### SSH

Autostart SSH agent and add keys.

```bash
# SSH agent
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" >/dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" >/dev/null
    #ps $SSH_AGENT_PID doesn't work under Cygwin
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
        start_agent
    }
else
    start_agent
fi
```

### Miscellaneous snippets

```bash
# Compile and run java file with arguments
function jcr() {
    # If no arguments are given, print explanation
    if [ $# -eq 0 ]; then
        echo "Compile and run Java file with optional arguments. Don't include the extension in the file name."
        echo "Usage: jcr <filename> <arguments>"
        echo "Example: jcr Multiply 2 3"
        return
    fi

    # Compile with UTF-8 encoding and pass arguments
    javac -encoding UTF-8 "$1.java" && java "$1" "${@:2}"
}
```

```bash
# Lazy git add, commit and push with message
function gacp() {
    # If no arguments are given, print explanation
    if [ $# -eq 0 ]; then
        echo "Lazily add, commit and push all changes to the repository."
        echo "Usage: lazygit <message>"
        echo "Example: lazygit \"Initial commit\""
        return
    fi

    git add . && git commit -a -m "$1" && git push
}
```
