autoload -Uz compinit
compinit

NEWLINE=$'\n'
PROMPT="%F{#fbfaa2}${ZSH_NAME}${ZSH_VERSION}%f%b %~ ${NEWLINE}$ "

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    # zsh-syntax-highlighting
)

# = Manage PATHs ===============================================================
# export PATH="/path/to/dir1:/path/to/dir2:$PATH"

# = Custom Functions ===========================================================

# -----------------------------------------------------------------------------
# AI-powered Git Commit Function
# 1) gets the current staged changed diff
# 2) sends them to an LLM to write the git commit message
# 3) allows you to easily accept, edit, regenerate, cancel
# the `llm` CLI util is awesome, can get it here: https://llm.datasette.io/en/stable/

gcmai() {
    # Function to generate commit message
    generate_commit_message() {
        git diff --cached | llm "
Below is a diff of all staged changes, coming from the command:

\`\`\`
git diff --cached
\`\`\`

Please generate a concise, one-line commit message for these changes."
    }

    # Function to read user input compatibly with both Bash and Zsh
    read_input() {
        if [ -n "$ZSH_VERSION" ]; then
            echo -n "$1"
            read -r REPLY
        else
            read -p "$1" -r REPLY
        fi
    }

    # Main script
    echo "Generating AI-powered commit message..."
    commit_message=$(generate_commit_message)

    while true; do
        echo -e "\nProposed commit message:"
        echo "$commit_message"

        read_input "Do you want to (a)ccept, (e)dit, (r)egenerate, or (c)ancel? "
        choice=$REPLY

        case "$choice" in
            a|A )
                if git commit -m "$commit_message"; then
                    echo "Changes committed successfully!"
                    return 0
                else
                    echo "Commit failed. Please check your changes and try again."
                    return 1
                fi
                ;;
            e|E )
                read_input "Enter your commit message: "
                commit_message=$REPLY
                if [ -n "$commit_message" ] && git commit -m "$commit_message"; then
                    echo "Changes committed successfully with your message!"
                    return 0
                else
                    echo "Commit failed. Please check your message and try again."
                    return 1
                fi
                ;;
            r|R )
                echo "Regenerating commit message..."
                commit_message=$(generate_commit_message)
                ;;
            c|C )
                echo "Commit cancelled."
                return 1
                ;;
            * )
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}

export DISABLE_AUTO_UPDATE="true"
export HOMEBREW_NO_AUTO_UPDATE=1
source $ZSH/oh-my-zsh.sh

# = Alias ======================================================================

# Misc
alias ll="ls -la"

# Git
alias gst="git status"
alias gcm="git commit -m"
alias gadd="git add"

# Kubernetes
alias k="kubectl"
alias kn="k config set-context --current --namespace"
alias kg="k get"
alias kgp="k get pod"
alias kd="k describe"
alias kdp="k describe pod"

# Workplace
alias wplace="cd $HOME/workplace"
alias psn="cd $HOME/workplace/personal"
alias pstudios="cd $HOME/workplace/playstudios"

source <(kubectl completion zsh)
