# Settings
export VISUAL=hx
export EDITOR="$VISUAL"

# Aliases
alias ls='ls --color'
alias ll='ls -lh --color'
alias la='ls -lah --color'
alias dots='/usr/bin/git --git-dir=/home/duskyelf/.dotfiles --work-tree=/home/duskyelf'

# Vscode
export PATH="$HOME/.local/VSCode-linux-x64/bin:$PATH"

# Appended
. "$HOME/.cargo/env"

# Prompt
eval "$(starship init bash)"
