gitcp() {
  msg="Usage: gitcp [commit message]"
  if [ $# -eq 0 ]; then
    echo "$msg"
  elif [ $# -eq 1 ]; then
    git add . && git commit -m "$1" && git push
  else
    echo "$msg"
  fi
}

awsprofile() {

  local profiles_file="$HOME/.aws/config"
  local i=1
  typeset -a options

  if [ $# -eq 0 ]; then
  # echo "Usage: awsprofile [profile-name]"
        if [ ! -f "$profiles_file" ]; then
      echo " No se encontró el archivo de perfiles: $profiles_file"
      return 1
    fi

    echo "Selecciona el entorno para hacer login en AWS:"

    while IFS= read -r line || [ -n "$line" ]; do
      if [[ "$line" =~ \[profile[[:space:]]+(.+)\] ]]; then
        profile="${match[1]}"
        options+=("$profile")
        echo "$i) $profile"
        ((i++))
      fi
      
    done < "$profiles_file"

    if [ ${#options[@]} -eq 0 ]; then
      echo "No se encontraron perfiles válidos."
      return 1
    fi

    read "choice?Opción: "
    selected_index=$((choice))

    if (( $selected_index < 0 || $selected_index > "${#options[@]}" )); then
      echo "Opcion invalida. Saliendo..."
      return 1
    fi

    selected_profile="${options[$selected_index]}"
    export AWS_PROFILE="$selected_profile"
    echo "Perfil '$selected_profile' seleccionado."

    #aws sts get-caller-identity --output table
    aws sso login --profile "$selected_profile"
  elif [ $# -eq 1 ]; then
    aws sso login --profile "$1"
  else
    echo "Usage: awsprofile [profile-name]"
  fi
}

unix_safe() {
  branch="$(git rev-parse --abbrev-ref HEAD)"
  git diff --name-only "origin/$branch" | while read -r file; do
    if git ls-files --error-unmatch "$file" >/dev/null 2>&1 && [ -f "$file" ]; then
      dos2unix "$file"
    fi
  done
}


fix_dos() {
  local dir="${1:-.}"
  find "$dir" -type f \( -name "*.yaml" -o -name "*.sh" \) -exec dos2unix {} \;
}

fkb() {
  if [ $# -eq 0 ]; then
    echo "Usage: kb [namespace]"
  elif [ $# -eq 1 ]; then
    kubectl config set-context --current --namespace="$1"
  else
    echo "Usage: kb [namespace]"
  fi
}

fks() {
  PS3="Select namespace: "
  ##*/
  select ns in $(kubectl get ns -o name) exit; do
      case $ns in
          exit) echo "exiting"; break;;
          *) echo "Changing namespace to" $(basename ${ns}); kubectl config set-context --current --namespace=$(basename ${ns}); break;;
      esac
  done
}

# kubenchn
kn() {
  kubechn $(kubechn | fzf)
}

fkx() {
  PS3="Select context: "
  select context in $(kubectl config get-contexts -o name) exit; do
      case $context in
          exit) echo "exiting"; break;;
          *) echo "Changing context to" $context; kubectl config use-context $context; break;;
      esac
  done
}

# kubechc
kc() {
  kubechc $(kubechc | fzf)
}

listening() {
    if [ $# -eq 0 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

# file search function
function f() { sudo find . -iname "*$1*" ${@:2} }

# file text on files
function r() { sudo grep --files-with-matches "$1" ${@:2} -R . }

# create folder and move into it in one command
function mkcd() {mkdir -p "$@" && cd "$_"; }
