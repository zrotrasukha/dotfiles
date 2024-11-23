# Vi mode for Fish
set -g fish_greeting
bind \ce autosuggest-accept
fish_vi_key_bindings

# Source global definitions (Fish equivalent)
if test -f /etc/fish/config.fish
    source /etc/fish/config.fish
end

# Set up PATH if not already included
if not contains "$HOME/.local/bin" $PATH
    set -gx PATH $HOME/.local/bin $HOME/bin $HOME/scripts $HOME/.console-ninja/.bin $PATH
end

# Uncomment the following line if you don't like systemctl's auto-paging feature
# set -gx SYSTEMD_PAGER ""

# Source all .fish files in ~/.config/fish/conf.d/ if directory exists
if test -d ~/.config/fish/conf.d
    for rc in ~/.config/fish/conf.d/*.fish
        source $rc
    end
end

# yazi config (Fish function)
function yy
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file "$tmp"
    set -l cwd (cat "$tmp")
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd "$cwd"
    end
    rm -f "$tmp"
end


# Homebrew environment setup
if test -d ~/.linuxbrew
    eval ("/home/linuxbrew/.linuxbrew/bin/brew shellenv")
end

# NVM initialization
set -gx NVM_DIR "$HOME/.nvm"
set -gx PATH $PATH $PWD/lua_env/bin
set -gx TREESITTER_DIR ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser

# functions: 
function g
    # Check if two arguments are provided
    if test (count $argv) -eq 2
        # Compile the first argument to the file named in the second argument
        g++ $argv[1] -o $argv[2] && ./$argv[2]

        # Check if only one argument is provided
    else if test (count $argv) -eq 1
        # Compile the file to a default temporary location
        g++ $argv[1] -o /tmp/cpp_program && /tmp/cpp_program
        # Delete the temporary file after running it
        rm -f /tmp/cpp_program

        # If there are no arguments or more than two, print usage message
    else
        echo "Usage: runcpp <source-file> [output-name]"
    end
end

#tmuxifier
set -gx PATH $PATH ~/.tmuxifier/bin
eval (tmuxifier init - fish)

# Aliases
alias fire tmuxifier
alias fs "nvim ~/.config/fish/config.fish"
alias y yazi
alias blueon "hyprshade on blue-light-filter"
alias bo "hyprshade on blue-light-filter"
alias blueoff "hyprshade off"
alias bf "hyprshade off"
alias wifi "nmcli dev wifi"
alias wifir "nmcli radio wifi"
alias bt bluetoothctl
alias q exit
function bton
    bluetoothctl power on
end
function btoff
    bluetoothctl power off
end
alias snips "nvim /home/zrotrasukha/dotfiles/nvim/.config/nvim/lua/config/luasnip.lua"
alias dots "cd ~/dotfiles"
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
eval (starship init fish)
alias sb "source ~/.config/fish/config.fish"
alias v nvim
alias lss "pactl list short sinks"
alias co "pactl set-default-sink"
alias c clear
alias ccp "cliphist wipe"
alias rd "hyprctl reload"
alias sus "systemctl suspend"
alias ncs "nmcli connection show"
alias open xdg-open
alias cfp "pwd | wl-copy"

# Tmux Aliases
alias t tmux
alias ta "tmux attach-session"
alias tns "tmux new-session -s"
alias tks "tmux kill-session -t"
alias tka "tmux kill-server"
alias tas "tmux attach-session -t"
alias td "tmux resize-pane -D"
alias tu "tmux resize-pane -U"
alias tr "tmux resize-pane -R"
alias tl "tmux resize-pane -L"
alias ts "tmux swap-window -t"
# Coding files
alias way "nvim ~/.config/waybar"
alias b "nvim ~/.config/fish/config.fish"
alias plugs "nvim ~/.config/nvim/lua/plugins/"
alias conf "nvim ~/.config/hypr/hyprland.conf"
alias obs "nvim /home/zrotrasukha/MEGA/MEGA/Knowledge_and_Info"
alias blue "nvim ~/.config/hypr/shaders/blue-light-filter.glsl"
alias 100 "cd /home/zrotrasukha/MEGA/MEGA/100xDev"
alias coding "cd /home/zrotrasukha/MEGA/MEGA/coding-ground"
# fzf Aliases
alias f 'cd (fzf --preview "bat --color always {}")'
alias fn 'nvim (fzf --preview "bat --color always {}")'
alias fy 'yazi (fzf --preview "bat --color always {}")'

# Website Aliases
alias 100x 'xdg-open https://app.100xdevs.com/courses/14'
alias yt 'xdg-open https://www.youtube.com'
alias amigo "xdg-open https://amigo.amityonline.com/my/"
alias mdb "xdg-open https://www.mongodb.com/docs/manual/tutorial/install-mongodb-community-with-docker/"

# Docker-related Aliases and Functions
alias dps "sudo docker ps"
function drun
    set -l name (or $argv[1] "mongodb")
    set -l port (or $argv[2] "27017")
    set -l filePath (or $argv[3] "$HOME/mongoExport")
    sudo docker run --name "$name" -v "$filePath":/data -p "$port":27017 -d mongo:latest
end
function darn
    set -l name (or $argv[1] "mongodb")
    sudo docker run --rm --name "$name" -it mongo mongosh "mongodb+srv://cluster1.kbh42.mongodb.net/" --apiVersion 1 --username zrotrasukha
end
function dexp
    set -l dbName (or $argv[1] "test")
    set -l collectionName (or $argv[2] "users")
    set -l fileName (or $argv[3] "$collectionName.json")
    sudo docker run --rm -v (pwd):/data -it mongo bash -c "mongoexport --uri 'mongodb+srv://cluster0.7xf16.mongodb.net/$dbName' --collection $collectionName --out /data/$fileName --jsonArray --username zrotrasukha"
end
alias db "cd ~/dockstore"
function dimp
    set -l dbName (or $argv[1] "test")
    set -l collectionName (or $argv[2] "users")
    set -l fileName (or $argv[3] "$collectionName.json")
    sudo docker run --rm -v (pwd):/data -it mongo bash -c "mongoimport --uri 'mongodb+srv://cluster0.7xf16.mongodb.net/$dbName' --collection $collectionName --file /data/$fileName --jsonArray --username zrotrasukha"
end
function msh
    set -l name (or $argv[1] "mongodb")
    set -l port (or $argv[2] "27017")
    sudo docker exec -it "$name" mongosh
end
function drm
    set -l session (or $argv[1] "mongodb")
    sudo docker rm -f "$session"
end
function frm
    set -l appName (or $argv[1] "")
    rm ~/.local/share/applications/"$appName".desktop
end

# HTTPie function
function hl
    set -l method (or $argv[1] "GET")
    set -l port (or $argv[2] "3000")
    set -l endPoints (or $argv[3] "")
    http "$method" http://localhost:"$port"/"$endPoints"
end

# nvm initialization for Fish
if test -d "$HOME/.nvm"
    bass source $HOME/.nvm/nvm.sh --no-use
end

# Optionally, for nvm bash completion
if test -f "$HOME/.nvm/bash_completion"
    bass source $HOME/.nvm/bash_completion
end


set -gx EDITOR nvim
set -gx VISUAL nvim

# bun
set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH $BUN_INSTALL/bin $PATH
set -gx PATH $PATH /home/zrotrasukha/.spicetify

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
