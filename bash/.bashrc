# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$HOME/scripts:$HOME/.console-ninja/.bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

# yazi config
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Homebrew environment setup
if test -d ~/.linuxbrew; then
  eval "$(~/.linuxbrew/bin/brew shellenv)"
elif test -d /home/linuxbrew/.linuxbrew; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# NVM initialization
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:$PWD/lua_env/bin"
export TREESITTER_DIR=~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser
#alias
alias blueon="hyprshade on blue-light-filter" #bluelight
alias bo="hyprshade on blue-light-filter"     #bluelight
alias blueoff="hyprshade off"
alias bf="hyprshade off"
# wifi
alias wifi="nmcli dev wifi"
alias wifir="nmcli radio wifi"
alias bt="bluetoothctl"
alias q="exit"
bton() {
  bluetoothctl power on
}
btoff() {
  bluetoothctl power off
}
eval "$(starship init bash)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
alias plugs="nvim ~/.config/nvim/lua/plugins/"
alias sb="source ~/.bashrc"
alias b="nvim ~/.bashrc"
alias t="tmux"
alias ta="tmux a"
alias tns="tmux new-session -s"
alias tks="tmux kill-session -t"
alias tka="tmux kill-server"
alias v="nvim"
alias lss="pactl list short sinks"
alias c="clear"
alias ccp="cliphist wipe"
alias way="v ~/.config/waybar"
alias conf="nvim ~/.config/hypr/hyprland.conf"
alias rd="hyprctl reload"
alias sus="systemctl suspend"
alias ncs="nmcli connection show"
alias blue="nvim .config/hypr/shaders/blue-light-filter.glsl"
alias open="xdg-open"
alias cfp="pwd | wl-copy"
alias obs="nvim /home/zrotrasukha/MEGA/MEGA/Knowledge_and_Inf"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
eval "$(fzf --bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export PATH=$PATH:/home/zrotrasukha/.spicetify
