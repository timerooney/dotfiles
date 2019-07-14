# Prompt format
GREEN="\[$(tput setaf 2)\]"
CYAN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"

PS1="[$GREEN\u$RESET.$GREEN\h$RESET: $CYAN\w$RESET]$ "

# Todo.txt configuration
export TODO_DEFAULT_ACTION=ls
alias t='$HOME/.tools/todotxt/todo.sh -d $HOME/.tools/todotxt/todo.cfg -t'
source $HOME/.tools/todotxt/todo_completion
