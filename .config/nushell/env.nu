# Env Variables
let editor = "hx"
$env.VISUAL = $editor
$env.EDITOR = $editor

# Prompt setup
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
