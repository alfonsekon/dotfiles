# #!/bin/bash


#
#
#
# i do not know what this file is for anymore
#
#
#



# project=$(find ~/ ~/coding/android-studio/ ~/coding/vscode ~/school/third-year/second-sem ~/dotfiles -mindepth 1 -maxdepth 1 | fzf)

# if [[ -z "$project" ]]; then
#     exit 0
# fi

# if [[ -d "$project" ]]; then
#     cd "$project" || exit
#     wezterm cli set-tab-title "$(basename "$project")"
#     wezterm cli spawn --cwd "$project" nvim "$project"
# else
#     wezterm cli set-tab-title "$(basename "$project")"
#     nvim "$project"
# fi

# exec $SHELL


#!/bin/bash

#only call/execute sessionizers within a bash session.
#this will not behave as expected when inside vim or other TUI applications

#REEEEEEEEEEEEEEEe
#!/bin/bash

#only call/execute sessionizers within a bash session.
#this will not behave as expected when inside vim or other TUI applications

selected=$(find $(pwd) ~/ ~/coding/android-studio/ ~/coding/vscode ~/school/third-year/second-sem ~/dotfiles -mindepth 1 -maxdepth 1 | fzf)

if [[ -z "$selected" ]]; then
    wezterm cli spawn --cwd "$PWD"
    exit 0
fi

selected=$(realpath "$selected")

if [[ "$selected" == *"android-studio/"* ]]; then
    #won't add the check if it's a dir or not since ill prolly open full projects with android studio anyways
    original_tab=$()
    tab_id=$(wezterm cli spawn --cwd "$selected")
    wezterm cli set-tab-title --pane-id "$tab_id" "$(basename "$selected")"

    echo "Opening in android-studio..."
    android-studio "$selected" > /dev/null 2>&1 
    wezterm cli kill-pane

    i3 workspace 3
else
    if [[ -d "$selected" ]]; then
        cd "$selected"
        wezterm cli set-tab-title "$(basename "$selected")"

        echo "Opening in vscode..."
        code -n --reuse-window "$selected" 
        i3 workspace 3
    else
        dir_name=$(dirname "$selected")
        cd "$dir_name"

        wezterm cli set-tab-title "$(basename "$dir_name")"
        echo "Opening in vscode..."
        code -n --reuse-window "$selected" 
        i3 workspace 3
    fi
fi

clear
