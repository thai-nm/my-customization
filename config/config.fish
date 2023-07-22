if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo (last $USER | head -n 1 | awk '{print "Last login:", $4, $5, $6, $7, "as", $1}')
end

function fish_prompt
    set_color 99cc99
    set_color fbfaa2

    echo -n "fish$FISH_VERSION "

    set_color normal

    echo (prompt_pwd)

    echo -n "\$ "
    
    # Reset color to default
    set_color normal
end

alias gst="git status"
alias gcm="git commit -m"
alias gadd="git add"
alias wplace="cd /home/thainm/workplace"
alias bi="cd /home/thainm/workplace/bi"
alias psn="cd /home/thainm/workplace/personal"

