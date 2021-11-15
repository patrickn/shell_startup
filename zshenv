# .zshenv is always sourced, it often contains exported variables that should be
# available to other programs. For example, $PATH, $EDITOR, and $PAGER are often
# set in .zshenv. Also, you can set $ZDOTDIR in .zshenv to specify an
# alternative location for the rest of your zsh configuration.
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
# ~./zshenv
#echo "Running ~./zshenv..."

# Update paths
export PATH=$PATH:~/local/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/opt/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/snap/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/opt/cross-pi-gcc/bin
export PATH=$PATH:/mnt/c/opt/vcpkg

export MANPATH=$MANPATH:~/local/man
export MANPATH=$MANPATH:/opt/bin
