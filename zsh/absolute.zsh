# alias
alias pa="php artisan"
alias change_php="sudo update-alternatives --config php"
alias la="ls -la"
alias v="nvim"
alias vh="nvim ."
alias ch="code ."
alias lg="lazygit"
alias sz="source ~/.zshrc"
alias vz="nvim ~/.zshrc"
alias ls="colorls"
alias ll="colorls -lA --sd --gs"
alias tree="colorls --tree --gs"
alias f='z $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)'
alias mkfile="install -Dv /dev/null"

pb() {
    php vendor/bin/$@
}

tx() {
    local session_name="$1"
    
    # Check if the session exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        # Attach to the existing session
        tmux attach -t "$session_name"
    else
        # Create a new session
        tmux new-session -s "$session_name"
    fi
}

source $(dirname $(gem which colorls))/tab_complete.sh

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.
