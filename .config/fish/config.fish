# shorter python3
alias py="python3"
funcsave -q py

# replace ls with exa
alias ls="exa -aF --header --icons --git"
funcsave -q ls

# turn off greeting
set fish_greeting

# change default editor to nvim
set -Ux EDITOR nvim

# add flutter to path
fish_add_path -g -p /usr/bin/flutter/bin
fish_add_path -g -p $HOME/.pub-cache/bin

# add nvim to path
fish_add_path -g -p /opt/nvim-linux64/bin

# add cargo binaries to path
fish_add_path -g -p $HOME/.cargo/bin

# add .dotnet/tools to path
fish_add_path -g -p $HOME/.dotnet/tools

# add pyenv to path
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

# replace vim with nvim
alias vim="nvim"
funcsave -q vim

# start ssh-agent if not already running
if not pgrep --full ssh-agent | string collect > /dev/null
    eval (ssh-agent -c 2> /dev/null)
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

zoxide init --cmd cd fish | source
starship init fish | source
pyenv init - fish | source
