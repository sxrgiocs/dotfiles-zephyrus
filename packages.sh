#/bin/bash

# pacstrap base base-devel amd-ucode

# Basic services
sudo pacman -S openssh bluez bluez-utils dialog networkmanager wpa_supplicant iwd jdk-openjdk \
               jre-openjdk grub dosfstools mtools os-prober pulseaudio pulseaudio-bluetooth \
               pavucontrol libldac wireless_tools xdg-utils xdg-user-dirs xarchiver unrar \
               rar zip unzip 7-zip blueberry ntfs-3g udiskie libva-vdpau-driver \
               libvdpau-va-gl libva-mesa-driver --needed

# Display manager and WM
sudo pacman -S xorg xorg-xinit xclip bspwm sxhkd --needed

# Graphics
#sudo pacman -S nvidia nvidia-utils nvidia-prime
sudo pacman -S nvidia-dkms nvidia-utils nvidia-prime --needed

# Misc
sudo pacman -S nitrogen rofi cups hplip git wget lxappearance kitty firefox bat lsd fzf pcmanfm \
               reflector rsync texlive-core texlive-latexextra texlive-pictures zathura zathura-pdf-poppler \
               stow okular mpv obs-studio gnome-screenshot scrot gnome-calculator libappimage gnome-calendar \
               qbittorrent calibre tmux --needed

# Code packages 
sudo pacman -S python-pip cuda cudnn python-tensorflow-cuda npm tk --needed

#Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

# Install yay packages
yay -S polybar qt5ct qt5-styleplugins languagetool glxinfo zsh-autosuggestions zsh-autocomplete \
       zsh-theme-powerlevel10k picom-bhagwan-git xtitle spotify spicetify-cli nvim-packer-git \
       downgrade thefuck betterlockscreen obsidian notion-app blight --needed

# Fonts
yay -S ttf-ms-fonts ttf-unifont ttf-font-awesome ttf-google-sans nerd-fonts-jetbrains-mono \
        adobe-source-code-pro-fonts otf-symbola --needed

# Corporate
yay -S autofirma-bin

# Stow dotfiles
git clone https://gitlab.com/sxrgiocs/dotfiles-zephyrus.git ~/.dotfiles
cd .dotfiles 
stow */

# Misc commands
betterlockscreen -u betterlockscreen -u /home/sergio/Pictures/Wallpaper/v3-290920-rocket-minimalist-desktop-wallpaper-4k.png

# Enable services 
sudo systemctl enable bluetooth
sudo systemctl enable cups
sudo systemctl enable sshd
sudo systemctl enable NetworkManager
sudo systemctl --user enable asus-notify.service
systemctl enable reflector.timer

sudo reflector -c Spain -a 5 --sort rate --save /etc/pacman.d/mirrorlist
