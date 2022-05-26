#
# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
                                        
########################################################################
#             Z S H R C  D E F A U L T  C O N F I G                    #
########################################################################

# Instant prompt by p10k
#
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

set +m

setopt autocd

#Fix the Java problem
export _JAVA_AWT_WM_NONPARENTING=1
export _JAVA_AWT_WM_NONREPARENTING=1

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/"
export PATH=$PATH:$JAVA_HOME/bin

# NPM path
export PATH=~/.npm-global/bin:$PATH

#HWA
#export LIBVA_DRIVER_NAME=radeonsi

# Paths
#PYTHONPATH=/usr/lib/python38.zip:/usr/lib/python3.8:/usr/lib/python3.8/lib-dynload:/home/sergio/.local/lib/python3.8/site-packages:/usr/lib/python3.8/site-packages:/home/sergio/.local/bin
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/sergio/.local/bin

# set default editor
export VISUAL=nvim
export EDITOR=nvim

# Make qt programs use gtk theme with qt5ct 
export QT_QPA_PLATFORMTHEME=gtk2

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sergio/.zshrc'

# End of lines added by compinstall
autoload -Uz compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# Vi mode 
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins 
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' 
preexec() { echo -ne '\e[5 q' ;} 

bindkey "^?" backward-delete-char # use backspace in insert mode

# Virtualenvwrapper
#export WORKON_HOME=~/.virtualenvs
#source /usr/bin/virtualenvwrapper_lazy.sh

########################################################################
#                        K E Y  B I N D I N G S                        #
########################################################################

# To get the correct format from /etc/inputrc just run:
# sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line


########################################################################
#                      M A N U A L  A L I A S E S                      #
########################################################################

# Disk space
alias disk='df -h | grep Filesystem & df -h | grep /dev/nvme0n1'

# Replace spaces of all contents of a folder
alias fuckspace='for f in *\ *; do mv "$f" "${f// /_}"; done'

# StartX DPI
alias xd='startx /home/sergio/.xinitrc_docked'
alias xl='startx /home/sergio/.xinitrc_laptop'

# Get key for remapping
alias keys='xev | awk -F'"'"'[ )]+'"'"' '"'"'/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'"'"''

# Lsd
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

# Bat
alias cat='/usr/bin/bat --paging=never'
alias catn='/usr/bin/cat'
alias catl='/usr/bin/bat'

# Vim and neovim
alias vimrc='ranger /home/sergio/.config/nvim'

# TUI programs with issues with unicode
alias pipes.sh='export LC_ALL="en_US.UTF-8" && pipes.sh'
alias btop='btop --utf-force'

# Config files
# alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME/'
alias dots='cd .dotfiles'

# Pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias pacsc='sudo pacman -Sc --noconfirm'       
alias pacscc='sudo pacman -Scc --noconfirm'       
alias yaysua="yay -Sua --noconfirm"              # update only AUR pkgs
alias yaysyu="yay -Syu --noconfirm"              # update standard pkgs and AUR pkgs
alias yaysc='yay -Sc --noconfirm'
alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
alias uninstall='sudo pacman -Rns'
alias install='sudo pacman -S '
alias backup='pacman -Qqe > $HOME/.config/0.Packages/all_packages.txt & pacman -Qqem > $HOME/.config/0.Packages/aur_packages.txt & pip list --user > $HOME/.config/0.Packages/pip-packages.txt'
alias pzf='yay -Slq | fzf --multi --preview '"'"'yay -Si {1}'"'"' | xargs -ro yay -S'

# Colorize grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias rmd='rm -rf -i'

# Navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Jupyter
alias jn='jupyter notebook'

#GRUB
alias winboot='sudo grub-reboot '"'"'$(grep -i windows /boot/grub/grub.cfg|cut -d"'\''\'\'''\''" -f2)'"'"' && sudo reboot'

# Ranger
alias media='ranger /run/media'
alias conf='ranger /home/sergio/.config'
alias uni='ranger /home/sergio/Documents/bioeng'
alias trash='ranger /home/sergio/.local/share/Trash/files'
alias moz='ranger /tmp/mozilla_sergio0'

# Git Configs
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias gitbme='/usr/bin/git --git-dir=$HOME/.uni --work-tree=$HOME'

alias bmeadd='gitbme add /home/sergio/Documents/bioeng/BME /home/sergio/Documents/bioeng/PSP /home/sergio/Documents/bioeng/MSP-2'

# Battery
alias batstatus='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

########################################################################
#                    C U S T O M  F U N C T I O N S                    #
########################################################################

# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# The fuck
eval $(thefuck --alias) 

# Extract files
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/sergio/Apps/zsh-plugins/zsh-window-title.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh
