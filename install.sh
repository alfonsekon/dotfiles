#!/bin/bash

printf "Welcome to the installation!

"

SELECTION=""
CURRENT_WINDOW="home"
TERMINATION_PHRASE="exit"

while [[ "${SELECTION,,}" != "$TERMINATION_PHRASE" ]]; do
    case "$CURRENT_WINDOW" in
        "home")
            printf "Select an option\n\n"
            printf "[1] Install Dependencies\n[2] Install Applications\n[3] Install Configs\n[4] Delete Configs\n\n"
            printf "Type '$TERMINATION_PHRASE' to exit.\n\n"
            printf ">>> "
            read SELECTION

            case "$SELECTION" in
                "1") CURRENT_WINDOW="install_dependencies" ;;
                "2") CURRENT_WINDOW="install_applications" ;;
                "3") CURRENT_WINDOW="install_configs" ;;
                "4") CURRENT_WINDOW="delete_configs" ;;
                "$TERMINATION_PHRASE") printf "Exiting...\n"; break ;;
                *) printf "Invalid selection. Try again.\n\n" ;;
            esac
            ;;

        "install_dependencies")
            printf "INSTALL DEPENDENCIES\n"
            printf "[1] Install system utilities (fzf, exa, zoxide, etc.)\n"
            printf "[h] Back to home\n\n"
            printf ">>> "
            read SELECTION

            case "$SELECTION" in
                "1") printf "Installing system utilities...\n"; sudo apt install fzf exa zoxide -y ;;
                "h") CURRENT_WINDOW="home" ;;
                *) printf "Invalid selection.\n" ;;
            esac
            ;;

        "install_applications")
            printf "INSTALL APPLICATIONS\n"
            printf "[1] Install Neovim\n[2] Install VS Code\n[3] Install WezTerm\n[4] Install Tmux\n[5] Install Picom\n"
            printf "[h] Back to home\n\n"
            printf ">>> "
            read SELECTION

            case "$SELECTION" in
                "1") printf "Installing Neovim...\n"; sudo apt install neovim -y ;;
                "2") printf "Installing VS Code...\n"; sudo apt install code -y ;;
                "3") printf "Installing WezTerm...\n"; sudo apt install wezterm -y ;;
                "4") printf "Installing Tmux...\n"; sudo apt install tmux -y ;;
                "5") printf "Installing Picom...\n"; sudo apt install picom -y ;;
                "h") CURRENT_WINDOW="home" ;;
                *) printf "Invalid selection.\n" ;;
            esac
            ;;

        "install_configs")
            printf "INSTALL CONFIGS\n"
            printf "[1] Install Bash config\n[2] Install i3 config\n[3] Install Neovim config\n[4] Install WezTerm config\n[5] Install Tmux config\n[6] Install Picom config\n[7] Install VS Code config\n"
            printf "[h] Back to home\n\n"
            printf ">>> "
            read SELECTION

            case "$SELECTION" in
                "1") printf "Installing Bash config...\n"; stow -t ~ bash ;;
                "2") printf "Installing i3 config...\n"; stow -t ~ i3 ;;
                "3") printf "Installing Neovim config...\n"; stow -t ~ nvim ;;
                "4") printf "Installing WezTerm config...\n"; stow -t ~ wezterm ;;
                "5") printf "Installing Tmux config...\n"; stow -t ~ tmux ;;
                "6") printf "Installing Picom config...\n"; stow -t ~ picom ;;
                "7") printf "Installing VS Code config...\n"; stow -t ~ vscode ;;
                "h") CURRENT_WINDOW="home" ;;
                *) printf "Invalid selection.\n" ;;
            esac
            ;;

        "delete_configs")
            printf "DELETE CONFIGS\n"
            printf "[1] Delete Bash config\n[2] Delete i3 config\n[3] Delete Neovim config\n[4] Delete WezTerm config\n[5] Delete Tmux config\n[6] Delete Picom config\n[7] Delete VS Code config\n"
            printf "[h] Back to home\n\n"
            printf ">>> "
            read SELECTION

            case "$SELECTION" in
                "1") printf "Deleting Bash config...\n"; rm -rf ~/.bashrc ;;
                "2") printf "Deleting i3 config...\n"; rm -rf ~/.config/i3 ;;
                "3") printf "Deleting Neovim config...\n"; rm -rf ~/.config/nvim ;;
                "4") printf "Deleting WezTerm config...\n"; rm -rf ~/.config/wezterm ;;
                "5") printf "Deleting Tmux config...\n"; rm -rf ~/.tmux.conf ;;
                "6") printf "Deleting Picom config...\n"; rm -rf ~/.config/picom.conf ;;
                "7") printf "Deleting VS Code config...\n"; rm -rf ~/.config/Code/User ;;
                "h") CURRENT_WINDOW="home" ;;
                *) printf "Invalid selection.\n" ;;
            esac
            ;;
    esac
done
