# .bashrc

# bindings
set -o vi
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
alias y="yazi"
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

alias snips="nvim /home/zrotrasukha/dotfiles/nvim/.config/nvim/lua/config/luasnip.lua"
alias dots="cd ~/dotfiles"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"
alias sb="source ~/.bashrc"
alias v="nvim"
alias lss="pactl list short sinks"
alias c="clear"
alias ccp="cliphist wipe"
alias rd="hyprctl reload"
alias sus="systemctl suspend"
alias ncs="nmcli connection show"
alias open="xdg-open"
alias cfp="pwd | wl-copy"
#-------------------------------
# Tmux
alias t="tmux"
alias ta="tmux a"
alias tns="tmux new-session -s"
alias tks="tmux kill-session -t"
alias tka="tmux kill-server"
alias tas="tmux a -t"
#-------------------------------
#coding files
alias way="v ~/.config/waybar"
alias b="nvim ~/.bashrc"
alias plugs="nvim ~/.config/nvim/lua/plugins/"
alias conf="nvim ~/.config/hypr/hyprland.conf"
alias obs="nvim /home/zrotrasukha/MEGA/MEGA/Knowledge_and_Info"
alias blue="nvim .config/hypr/shaders/blue-light-filter.glsl"
alias 100="cd /home/zrotrasukha/MEGA/MEGA/100xDev"
#fzf-------------------
alias f='cd $( fzf --preview="bat --color=always {}" )'
alias fn='nvim $(fzf --preview="bat --color=always {}")'
alias fy='yazi $(fzf --preview="bat --color=always {}")'
#sites-----------------
alias 100x='xdg-open https://app.100xdevs.com/courses/14'
alias yt='xdg-open https://www.youtube.com'
alias amigo="xdg-open https://amigo.amityonline.com/my/"
alias mdb="xdg-open https://www.mongodb.com/docs/manual/tutorial/install-mongodb-community-with-docker/"
#Tmux-------------------
alias td="tmux resize-pane -D"
alias tu="tmux resize-pane -U"
alias tr="tmux resize-pane -R"
alias tl="tmux resize-pane -L"
#layout-----------------
alias us='hyprctl keyword input:kb_variant "us"'
alias cl='hyprctl keyword input:kb_variant "colemak"'
#mongodb----------------
alias dp='sudo docker pull mongodb/mongodb-community-server:latest'
alias keys='nvim /home/zrotrasukha/dotfiles/nvim/.config/nvim/lua/config/keymaps.lua'
drun() {
  local name=${1:-mongodb} # Default to "mongodb" if no name is provided
  local port=${2:-27017}   # Default to port 27017 if no port is provided
  local filePath=${3:-~/mongoExport}
  # sudo docker run -d --name "$name" -p "$port:27017" mongodb/mongodb-community-server:latest
  sudo docker run --name "$name" \
    -v "$filePath":/data \
    -p "$port":27017 \
    -d mongo:latest
}

darn() {
  local name=${1:-mongodb}
  sudo docker run --rm --name "$name" -it mongo mongosh "mongodb+srv://cluster0.7xf16.mongodb.net/" --apiVersion 1 --username zrotrasukha
}
dexp() {
  local dbName=${1:-test}
  local collectionName=${2:-users}
  local fileName=${3:-$collectionName.json}

  sudo docker run --rm -v $(pwd):/data -it mongo bash -c \
    "mongoexport --uri='mongodb+srv://cluster0.7xf16.mongodb.net/$dbName' --collection $collectionName --out /data/$fileName --jsonArray --username zrotrasukha"
}
alias db="cd ~/dockstore"
dimp() {
  local dbName=${1:-test}
  local collectionName=${2:-users}
  local fileName=${3:-$collectionName.json}

  sudo docker run --rm -v $(pwd):/data -it mongo bash -c \
    "mongoimport --uri='mongodb+srv://cluster0.7xf16.mongodb.net/$dbName' --collection $collectionName --file /data/$fileName --jsonArray --username zrotrasukha"
}

# Function to run mongosh with a custom port
msh() {
  local name=${1:-mongodb} # Default to "mongodb" if no name is provided
  local port=${2:-27017}   # Default to port 27017 if no port is provided
  sudo docker exec -it "$name" mongosh
}

drm() {
  local session=${1:mongodb}
  sudo docker rm -f "$session"
}
frm() {
  local appName=${1:-}
  rm ~/.local/share/applications/"$appName".desktop

}
alias dps="sudo docker ps"
#----------------------
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
eval "$(fzf --bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export EDITOR=nvim
export VISUAL=nvim
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export PATH=$PATH:/home/zrotrasukha/.spicetify
