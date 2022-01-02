#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# put in vi mode:
bindkey -v

# set editor
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim

# add kj and jk to insert mode
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode

#source zsh-snippets/snippets.plugin.zsh

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

export PATH=~/.dotfiles/bin:${PATH}

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

alias ipython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export PATH=/usr/local/bin:${PATH}
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/urlscan/bin"

# tmux aliases
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias tid='tmux display-message -p "#S"'
function tk () {
  tmux kill-session -t $(tmux display-message -p '#S')
  docker kill $(docker ps -q) > /dev/null 2>&1
}

alias muxstart='tmuxinator start'
# source ~/scripts/_andi

# alias veracrypt on os x machines
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias veracrypt='/Applications/Veracrypt.app/Contents/MacOS/VeraCrypt --text'
fi

eval "$(fasd --init auto)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nathanbraun/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nathanbraun/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nathanbraun/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nathanbraun/google-cloud-sdk/completion.zsh.inc'; fi
if [ -e /Users/nathanbraun/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/nathanbraun/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# aliases
alias pomo='noti pomodoro --simple && bm-inc -g pomodoro && dijo -c "track-up pomo"'
alias pomo2="noti pomodoro --simple && bm-inc -g pomodoro && noti pomodoro --simple 5"
alias lz="lazygit"

export APY_ANKI_PATH=/Users/nathanbraun/anki/anki-2.1.40
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"

fpath=($HOME/.local/zsh-functions $fpath)

# function tn() (
#     if [ -n "$1" ]
#       then
#          tmux switch -t $1
#       else
#          echo "no session name"
#      fi
#   )
