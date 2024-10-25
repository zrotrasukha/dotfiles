set -g fish_greeting ""
# Use vi mode for Fish shell
fish_vi_key_bindings

# Source global Fish shell config (if needed, optional)
if test -f /etc/fish/config.fish
    source /etc/fish/config.fish
end

#fzf 
function fzf_select
    set file (fzf --height 40% --border --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if test -n "$file"
        commandline --insert $file
    end
end
# history 
function __fzf_history__
    set command (history | fzf --height 40% --border --tac --preview 'echo {}')
    if test -n "$command"
        commandline --insert $command
    end
end

bind \cr __fzf_history__


bind \ct fzf_select
# User specific environment
if not contains "$HOME/.local/bin" $PATH
    set -gx PATH $HOME/.local/bin $HOME/bin $HOME/scripts $HOME/.console-ninja/.bin $PATH
end

if test -d ~/.linuxbrew
    set -gx HOMEBREW_PREFIX ~/.linuxbrew
else if test -d /home/linuxbrew/.linuxbrew
    set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
end

if test -n "$HOMEBREW_PREFIX"
    set -gx PATH $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin $PATH
    set -gx MANPATH $HOMEBREW_PREFIX/share/man $MANPATH
    set -gx INFOPATH $HOMEBREW_PREFIX/share/info $INFOPATH
end
#
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# set -gx SYSTEMD_PAGER ""
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo 'eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.config/fish/config.fish
# Source user-specific configurations in ~/.bashrc.d (converted to Fish equivalent)
if test -d ~/.bashrc.d
    for rc in ~/.bashrc.d/*
        if test -f "$rc"
            source "$rc"
        end
    end
end

# yazi config (Fish syntax for functions)
function yy
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    set -l cwd (cat $tmp)
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd $cwd
    end
    rm -f $tmp
end

# # Homebrew environment setup
# if test -d ~/.linuxbrew
#     bass source ~/.linuxbrew/bin/brew shellenv
# else if test -d /home/linuxbrew/.linuxbrew
#     bass source /home/linuxbrew/.linuxbrew/bin/brew shellenv
# end


# NVM initialization
set -gx NVM_DIR "$HOME/.nvm"
set -gx PATH $PATH $PWD/lua_env/bin
set -gx TREESITTER_DIR ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser

# Aliases
alias fs "nvim ~/.config/fish/config.fish"
alias y yazi
alias blueon "hyprshade on blue-light-filter"
alias bo "hyprshade on blue-light-filter"
alias blueoff "hyprshade off"
alias bf "hyprshade off"

# WiFi and Bluetooth aliases
alias wifi "nmcli dev wifi"
alias wifir "nmcli radio wifi"
alias bt bluetoothctl
alias q exit

# Bluetooth power functions
function bton
    bluetoothctl power on
end

function btoff
    bluetoothctl power off
end

alias snips "nvim /home/zrotrasukha/dotfiles/nvim/.config/nvim/lua/config/luasnip.lua"
alias dots "cd ~/dotfiles"
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
starship init fish | source

alias sb "source ~/.config/fish/config.fish"
alias v nvim
alias lss "pactl list short sinks"
alias c clear
alias ccp "cliphist wipe"
alias rd "hyprctl reload"
alias sus "systemctl suspend"
alias ncs "nmcli connection show"
alias open xdg-open
alias cfp "pwd | wl-copy"

# Tmux aliases
alias t tmux
alias ta "tmux a"
alias tns "tmux new-session -s"
alias tks "tmux kill-session -t"
alias tka "tmux kill-server"
alias tas "tmux a -t"

# Coding files
alias way "nvim ~/.config/waybar"
alias b "nvim ~/.bashrc"
alias plugs "nvim ~/.config/nvim/lua/plugins/"
alias conf "nvim ~/.config/hypr/hyprland.conf"
alias obs /home/zrotrasukha/MEGA/MEGA/Knowledge_and_Info
alias blue "nvim ~/.config/hypr/shaders/blue-light-filter.glsl"
alias 100 "cd /home/zrotrasukha/MEGA/MEGA/100xDev"

# fzf aliases (using Fish's syntax)
alias f 'cd (fzf --preview="bat --color=always {}")'
alias fn 'nvim (fzf --preview="bat --color=always {}")'
alias fy 'yazi (fzf --preview="bat --color=always {}")'

# Site shortcuts
alias 100x 'xdg-open https://app.100xdevs.com/courses/14'
alias yt 'xdg-open https://www.youtube.com'
alias amigo "xdg-open https://amigo.amityonline.com/my/"
alias mdb "xdg-open https://www.mongodb.com/docs/manual/tutorial/install-mongodb-community-with-docker/"

# Tmux pane resizing
alias td "tmux resize-pane -D"
alias tu "tmux resize-pane -U"
alias tr "tmux resize-pane -R"
alias tl "tmux resize-pane -L"

# Keyboard layout switching
alias us 'hyprctl keyword input:kb_variant "us"'
alias cl 'hyprctl keyword input:kb_variant "colemak"'

# Docker and MongoDB aliases/functions
alias dp 'sudo docker pull mongodb/mongodb-community-server:latest'
alias keys "nvim /home/zrotrasukha/dotfiles/nvim/.config/nvim/lua/config/keymaps.lua"

function drun
    set -l name (or "$argv[1]" "mongodb")
    set -l port (or "$argv[2]" 27017)
    set -l filePath (or "$argv[3]" "~/mongoExport")
    sudo docker run --name "$name" -v "$filePath":/data -p "$port":27017 -d mongo:latest
end

function darn
    set -l name (or "$argv[1]" "mongodb")
    sudo docker run --rm --name "$name" -it mongo mongosh "mongodb+srv://cluster0.7xf16.mongodb.net/" --apiVersion 1 --username zrotrasukha
end

function dexp
    set -l dbName (or "$argv[1]" "test")
    set -l collectionName (or "$argv[2]" "users")
    set -l fileName (or "$collectionName.json")
    sudo docker run --rm -v (pwd):/data -it mongo bash -c "mongoexport --uri='mongodb+srv://cluster0.7xf16.mongodb.net/$dbName' --collection $collectionName --out /data/$fileName --jsonArray --username zrotrasukha"
end

alias db "cd ~/dockstore"

function dimp
    set -l dbName (or "$argv[1]" "test")
    set -l collectionName (or "$argv[2]" "users")
    set -l fileName (or "$collectionName.json")
    sudo docker run --rm -v (pwd):/data -it mongo bash -c "mongoimport --uri='mongodb+srv://cluster0.7xf16.mongodb.net/$dbName' --collection $collectionName --file /data/$fileName --jsonArray --username zrotrasukha"
end

function msh
    set -l name (or "$argv[1]" "mongodb")
    set -l port (or "$argv[2]" 27017)
    sudo docker exec -it "$name" mongosh
end

function drm
    set -l session (or "$argv[1]" "mongodb")
    sudo docker rm -f "$session"
end

function frm
    set -l appName (or "$argv[1]" "")
    rm ~/.local/share/applications/"$appName".desktop
end

alias dps "sudo docker ps"

# httpie shortcuts
function hl
    set -l method (or "$argv[1]" "GET")
    set -l port (or "$argv[2]" 3000)
    set -l endPoints (or "$argv[3]" "")
    http "$method" http://localhost:$port/$endPoints
end

# Additional environment setup
set -gx EDITOR nvim
set -gx VISUAL nvim

# bun setup
set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH $BUN_INSTALL/bin $PATH
set -gx PATH $PATH /home/zrotrasukha/.spicetify
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
