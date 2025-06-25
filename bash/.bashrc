# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# adding nvim to PATH
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
export PATH=$PATH:/home/luis/.local/bin

# adding pyenv to PATH
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"

# adding nvm to PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# aliases for editing files
alias bashrc='nvim ~/.bashrc'
alias savebashrc='source ~/.bashrc'
alias i3conf='nvim ~/.config/i3/config'
alias todolist='nvim ~/school/todolist'
alias shellexec='exec $SHELL'
alias localdorm='192.168.68.240'

# cd shortcuts
alias codinga='cd ~/coding/android-studio && ls -la'
alias codingv='cd ~/coding/vscode && ls -la'
alias dotfiles='cd ~/dotfiles && ls -la'
alias downloads='cd ~/Downloads && ls -la'
alias school='cd ~/school/third-year/second-sem/ && ls -la'
alias cdeeznuts='cd'
alias please='sudo'

# aliases for opening programs
alias obs='flatpak run com.obsproject.Studio &'
alias starti3='startx /usr/bin/i3'
alias vim='nvim'
alias picom='picom --experimental-backends > /dev/null 2>&1 &'
alias cpus='hwinfo --cpu | grep Clock'
alias switchcaps="pkill xcape && xcape -e 'Alt_R=Caps_Lock'"
alias please='sudo'

# shell shortcuts
alias treenogit='tree -I ".git" -la'
alias ls='exa --icons'
alias ll='exa --icons -la'
alias j='z'
alias ji='zi'
alias ..='cd ..'
alias ...='cd ../..'
# alias fd='selected=$(find . -type d | fzf); [ -n "$selected" ] && cd "$selected"'
# alias ff='selected=$(fzf); [ -n "$selected" ] && vim "$selected"'
alias wec='wezterm cli'
alias rn='wezterm cli set-tab-title $(basename $(pwd))'
alias sessionizer_ide='source ~/scripts/wezterm_sessionizer_ide.sh'
alias sessionizer_vim='source ~/scripts/wezterm_sessionizer_vim.sh'
alias open_ide='source ~/dotfiles/wezterm/scripts/open_editor.sh'
alias open_vim='source ~/dotfiles/wezterm/scripts/open_vim.sh'

# git shortcuts
alias ga='git add'
alias gc='git commit -m'
alias gpush='git push'
alias gpull='git pull'
alias gs='git status'
alias gco='git checkout'

# copy and paste between TTYs (very hassle)
alias cclip='cat > /tmp/tty_clipboard'
alias clipp='cat /tmp/tty_clipboard'

# power options
alias eepy='systemctl suspend -i'
alias patay='systemctl poweroff'

# brightness controls
alias b0='sudo brightnessctl set 1%'
alias b1='sudo brightnessctl set 10%'
alias b2='sudo brightnessctl set 20%'
alias b3='sudo brightnessctl set 30%'
alias b4='sudo brightnessctl set 40%'
alias b5='sudo brightnessctl set 50%'
alias b6='sudo brightnessctl set 60%'
alias b7='sudo brightnessctl set 70%'
alias b8='sudo brightnessctl set 80%'
alias b9='sudo brightnessctl set 90%'
alias b10='sudo brightnessctl set 100%'
alias bup='sudo brightnessctl set +50'
alias bdown='sudo brightnessctl set 50-'

alias bg1='feh --bg-scale /usr/share/backgrounds/pop/nick-nazzaro-jungle-red.png'
alias bg2='feh --bg-scale /usr/share/backgrounds/pop/kate-hazen-fractal-mountains.png'
alias bg3='feh --bg-fill ~/Pictures/Screenshots/IMG_1699.png'

# battery/charging limitation
alias batt85='sudo sh -c "echo 85 > /sys/class/power_supply/BAT0/charge_control_end_threshold"'
alias batt100='sudo sh -c "echo 100 > /sys/class/power_supply/BAT0/charge_control_end_threshold"'

# for external mouse and keyboard since setxkbmap doesn't work if i plug peripherals after boot
mb() {
	if [ -z "$1" ]; then
		xinput | grep "slave  pointer" | awk '{print}'
		printf "\n"
		printf "    Usage: mb <device-id>\n"
		return 1
	fi

	setxkbmap -option caps:swapescape
	xinput --set-prop "$1" "libinput Accel Speed" 0
	xinput --set-prop "$1" "Coordinate Transformation Matrix" 0.6 0 0 0 0.6 0 0 0 1
	clear
}

xinput set-prop "ASUF1300:00 2808:0203 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop 'ASUF1300:00 2808:0203 Touchpad' "libinput Natural Scrolling Enabled" 1

mbl() {
	if [ -z "$1" ]; then
		xinput | grep "slave  pointer" | awk '{print}' | grep Logitech | awk '{print $5}'
		printf "\n"
		printf "    Usage: mb <device-id>\n"
		return 1
	fi

	setxkbmap -option caps:swapescape
	xinput --set-prop "$1" "libinput Accel Speed" 0
	xinput --set-prop "$1" "Coordinate Transformation Matrix" 0.6 0 0 0 0.6 0 0 0 1
	clear
}

#oh-my-posh config
eval "$(/home/luis/.local/bin/oh-my-posh init bash --config ~/.config/oh-my-posh/ayu.omp.json)"
eval "$(zoxide init bash)"
export PATH=$PATH:/usr/local/go/bin
