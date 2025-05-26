#!/usr/bin/env zsh

# Putting linuxbrew's bin at the beginning causes devtools/update-tool to fail
# see https://github.com/DataDog/devtools/blob/ff5e510b48e00a07dbae0e495c490d03c8e93ef3/apps/update-tool/update_tool.py#L294-L319
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# Adds fzf to PATH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
