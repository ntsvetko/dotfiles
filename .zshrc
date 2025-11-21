# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Natalie's zsh config

# Aliases
alias ls='ls --color=always'
alias mms='cd ~/mms'
alias mdb="$MMS_HOME/scripts/mdb"

# Nice Prompt Stuff
# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' %F{cyan}'$branch'%f 🪵'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

PROMPT="🐚 %F{cyan}[%1~]%f "
RPROMPT='$(git_branch_name)'

# vim?
bindkey -v

# Various Plugins
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


fpath[1,0]=$HOME/.zsh/completion

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/natalie/.zshrc'

autoload -Uz compinit
compinit 
# End of lines added by compinstall

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "/Users/natalie/.jabba/jabba.sh" ] && source "/Users/natalie/.jabba/jabba.sh"


source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/natalie/build/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/natalie/build/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/natalie/build/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/natalie/build/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$(brew --prefix)/opt/openssl@1.1/bin:$PATH"

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

export VOLTA_HOME="$HOME/.volta
export PATH="$VOLTA_HOME/bin:$PATH

. /Users/natalie/.asdf/asdf.sh
. /Users/natalie/.asdf/plugins/java/set-java-home.zsh
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export NVM_DIR="$HOME/.nvm"\n[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"\n[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
