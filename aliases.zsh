alias ls='eza -al --icons -F --group-directories-first -h --octal-permissions -g'
alias ll='eza -al --icons -F --group-directories-first -h --octal-permissions -g'
alias llf='eza -al --icons -F --group-directories-first -h --octal-permissions -gf'
alias lld='eza -al --icons -F --group-directories-first -h --octal-permissions -gD'
alias l='eza -l --icons -F --group-directories-first -h --octal-permissions -g'
alias h1="history 1"

alias ez='exec zsh'
alias cls='clear'

alias k='kubectl'
compdef __start_kubectl k

alias kx='kubectx'
alias kxf='kubectx | fzf'
compdef _kube_contexts kx

alias ks='kubens'
alias ksf='kubens | fzf'
compdef _kube_namespaces ks

# highlighting bat, global aliases to override --help (-h have conflicts) 
#alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias fzfp="fzf --preview 'bat --color=always {}' --preview-window 'right:70%:wrap'"

alias cdsource='cd $HOME/work/source'
alias cdopt='cd $HOME/work/opt'
alias cdciam='cd $HOME/work/source/cip/ciam'
alias asl='aws sso login'
alias python3='python'
alias python='/c/Program\ Files/Python313/python.exe'
alias gpg='/c/Program\ Files\ \(x86\)/GnuPG/bin/gpg'
alias frodo='/c/Users/x805537/work/source/cip/ciam/cidp-ciam-manage-cli/bin/frodo.exe'

alias amadmin='kubectl get secrets/am-env-secrets --template={{.data.AM_PASSWORDS_AMADMIN_CLEAR}} | base64 -d'
