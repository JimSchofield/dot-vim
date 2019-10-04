#!/usr/bin/env bash
# abort if we're already inside of a tmux session
[ "$TMUX" == "" ] || exit 0
# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=($(tmux list-sessions -F "#S" 2>/dev/null) "New Session" "zsh")
echo "Available Sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
    case $opt in
        "New Session")
            read -rp "Enter new session name: " SESSION_NAME
            tmux new -s "$SESSION_NAME"
            break
            ;;
        "zsh")
            zsh --login
            break;;
        *)
            tmux attach-session -t "$opt"
            break
            ;;
    esac
done
