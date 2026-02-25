export WORK="$HOME/work"
export OPT_BIN="$WORK/opt/bin"
export JAVA_HOME="$WORK/opt/java/jdk-17.0.2"
export PATH="$HOME/.config/starship/bin":$PATH
export PATH="$HOME/.config/starship":$PATH
export PATH="$OPT_BIN":$PATH
export PATH="$JAVA_HOME/bin":$PATH
# GNU GPG
export GNUPGHOME="$HOME/AppData/Roaming/gnupg"
# git secrets
export SECRETS_GPG_COMMAND="/c/Program Files (x86)/GnuPG/bin/gpg"
export EDITOR=nano
export VISUAL=nano

# delete % or # at the end of line
export PROMPT_EOL_MARK=''

# kubectl editor:
export KUBE_EDITOR=vim

# kubeconfig
#export KUBECONFIG=$HOME/.kube/config:$(find $HOME/.kube -maxdepth 1 -name '*.yaml' | tr '\n' ':')

# k9s
export K9S_CONFIG_DIR="$HOME/.config/k9s"
export XDG_CONFIG_HOME="$K9S_CONFIG_DIR"
export XDG_DATA_HOME="$K9S_CONFIG_DIR"
export K9S_LOGS_DIR="$K9S_CONFIG_DIR"

# bat
export BAT_CONFIG_PATH="$ZSH/bat.conf"
export BAT_CONFIG_DIR="$ZSH"

# Hide computer name in terminal
export DEFAULT_USER="$(whoami)"

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
setopt SHARE_HISTORY # Share history across terminals

unsetopt beep notify
bindkey -e

# Use the up and down keys to navigate the history
# bindkey "\e[A" history-beginning-search-backward
# bindkey "\e[B" history-beginning-search-forward
bindkey "^[[3~" delete-char

# Move to directories without cd
setopt autocd

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/c/Users/x805537/.zshrc'

# load completions
fpath=($ZSH/completions $fpath)

autoload -Uz compinit && compinit
# End of lines added by compinstall
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zsh_source() {
	source $1
}

# load all .zsh files except custom.zsh
for fzsh in $ZSH/*.zsh; do
	if [[ "${fzsh:t}" != "custom.zsh" ]]; then
		zsh_source $ZSH/${fzsh:t}
	fi
done
unset fzsh
unset -f zsh_source

# kubech
source kubech

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

	
eval "$(starship init zsh)"
