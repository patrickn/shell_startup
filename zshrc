# .zshrc is for interactive shell configuration. You set options for the
# interactive shell here with the setopt and unsetopt commands. You can also
# load shell modules, set your history options, change your prompt, set up zle
# and completion, etc. You also set any variables that are only used in the
# interactive shell (e.g. $LS_COLORS).
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
# ~/.zshrc:
echo "Running ~/.zshrc..."

autoload -Uz compinit promptinit
compinit
promptinit

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
HISTORY_IGNORE="(?|??|???|exit|history*|ls|ll)"

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt PROMPT_SUBST              # Various substitutions performed in prompts.

# cause up/down arrow keys to search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # Up
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search # Down

# case-insensitive matching only if there are no case-sensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

source ~/.shell_dotfiles/zsh/functions.zsh

# tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# exa
export EXA_COLORS="ur=2;32:uu=2;32:Makefile=35:ex=31:sn=32:ux=32:ue=32:*.md=34;04;4"

# zsh-z
source ~/local/plugins/zsh-z.plugin.zsh
zstyle ':completion:*' menu select

# set some configuration vars
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# Nodejs
# VERSION=v14.15.4
# DISTRO=linux-x64
# export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source $HOME/.aliases

# export PROMPT='%m:%~> '
# Change prompt colour if last command exited with error.
# export PROMPT='%(?.%(!.#.:%~> ).%F{6}%B:%~> %b%f)'
export PS1='$(fancy_dir) $(git_dot)$(seasonal_chevrons) '
export RPROMPT='$(git_branch)'