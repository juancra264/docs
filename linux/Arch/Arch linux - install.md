Hostname: convm
Domain: radudev.com
root: qwerty.
jcramirez: Ju4nCR4m.col
r4mp4k314: Ju4nCR4m.col

Download iso -arch x86_64

VM: 
  vcpu: 2
  ram: 4096
  disk: 20Gb one file
  nic: bridge


Reference:
https://linuxhint.com/arch_linux_minimal_install/

install commands process
	loadkeys es
	cfdisk
		select dos for vms
		for swap ram + 0.5G
		512M primary  for boot
		15G primary    for root
		4.5G primary  for swap
		
		change swap type to linux swap / solaris
		

		then write.
		
	lsblk
	
	mkfs.vfat -F 32 /dev/sda1
	mkfs.ext4 /dev/sda2
	mkswap /dev/sda3
	swapon /dev/sda3

	
	mount /dev/sda2 /mnt
	mkdir /mnt/boot
	mount /dev/sda1 /mnt/boot
	pacstrap /mnt linux linux-firmware networkmanager grub wpa_supplicant base base-devel
	
	genfstab -U /mnt
	genfstab -U /mnt > /mnt/etc/fstab
	cat !$
	
	To enable this swap partition on boot, add an entry to /etc/fstab:
	UUID=device_UUID none swap defaults 0 0
	
	arch-chroot /mnt
	
	passwd
	ls /home
	useradd -m [user]
	ls /home
	ls /home/ -l
	passwd  [user]
	usermod -aG wheel [user]
	groups [user]
	
	pacman -S sudo
	pacman -S vim nano
	
	nano /etc/sudoers
		uncomment wheel group
		%wheel ALL=(ALL:ALL) ALL
	su [user]
	id
	sudo su
	
	nano /etc/locale.gen
		uncommet en_US.UTF-8 UTF-8     es_CO.UTF-8 UTF-8
	locale-gen
	
	nano /etc/vconsole.conf
	         KEYMAP=es
	
	grub-install /dev/sda
	grub-mkconfig -o /boot/grub/grub.cfg
	
	cat /etc/hostname
	echo convm > /etc/hostname
	
	nano /etc/hosts
	       127.0.0.1 localhost
	       ::1 localhost
	       127.0.0.1 convm.localhost convm
	
	pacman -S neofetch
	
	reboot
	sudo su
	
	systemctl start NetworkManager.service
	systemctl enable NetworkManager.service
	
	systemctl start wpa_supplicant.service
	systemctl enable wpa_supplicant.service
	
	pacman -S git
	
	mkdir -p Desktop/r4mp4k314/repos
	cd !$
	git clone https://aur.archlinux.org/paru-bin.git
	cd paru-bin
	makepkg -si
	
	mkdir blackarch
	ls
	cd blackarch
	curl -O https://blackarch.org/strap.sh
	chmod +x strap.sh
	sudo su
	./strap.sh
	
	pacman -Sy
	
	pacman -Sgg | grep blackarch 
	
	pacman -S impacket
	
	Pentest categories:
	pacman -Sgg | grep blackarch  | awk '{print $1}'  |  sort -u | less
	
	pacman -S blackarch-wireless
	
Desktops Enviroment (GUI):
	pacman -S xorg xorg-server 
	pacman -S gnome
	
	systemctl start gdm.service
	systemctl enable gdm.service
	
	pacman -S kitty
	
	pacman -S gtkmm
	pacman -S open-vm-tools
	pacman -S xf86-video-vmware xf86-input-vmmouse
	
	cp /etc/vmware-tools/tools.conf.example /etc/vmware-tools/tools.conf
	nano /etc/vmware-tools/tools.conf
	Remove the # from this block:
		[resolutionKMS]
			# Default is true if tools finds an xf86-video-vmware driver with
			# version >= 13.2.0. If you don't have X installed, set this to true manually.
			# This only affects tools for Linux.
			enable=true
	systemctl enable vmtoolsd
	systemctl restart vmtoolsd.service
	
	sudo su
	vim /etc/systemd/system/multi-user.target.wants/vmtoolsd.service
	
	add this line at the end of the "Unit" section:
		After=graphical.target

	pacman -S firefox
	pacman -S zsh
	usermod --shell /usr/bin/zsh r4mp4k314
	
	cd
	nano .zshrc
```
# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source /home/r4mp4k314/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Manual configuration

PATH=/root/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat --plain'
alias vim='nvim0'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Plugins
source /usr/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-sudo/sudo.plugin.zsh

# Functions
function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

# Extract nmap information
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

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

# fzf improvement
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}

# Finalize Powerlevel10k instant prompt. Should stay at the bottom of ~/.zshrc.
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize

```
	
	paru -S zsh-syntax-highlighting zsh-autosuggestions
	pacman -S locate
	sudo updatedb

	pacman -S p7zip wget
	sudo pacman -S lsd bat
	paru -S scrub
	
	download  https://www.nerdfonts.com/
	sudo su
	cd /usr/share/fonts
	mv /home/r4mp4k314/Downloads/Hack.zip .
	unzip Hack.zip

	nano .config/kitty/color.ini
	color.ini:
```
cursor_shape          Underline
cursor_underline_thickness 1
window_padding_width  20

# Special
foreground #a9b1d6
background #1a1b26

# Black
color0 #414868
color8 #414868

# Red
color1 #f7768e
color9 #f7768e

# Green
color2  #73daca
color10 #73daca

# Yellow
color3  #e0af68
color11 #e0af68

# Blue
color4  #7aa2f7
color12 #7aa2f7

# Magenta
color5  #bb9af7
color13 #bb9af7

# Cyan
color6  #7dcfff
color14 #7dcfff

# White
color7  #c0caf5
color15 #c0caf5

# Cursor
cursor #c0caf5
cursor_text_color #1a1b26

# Selection highlight
selection_foreground #7aa2f7
selection_background #28344a
```

	cd
	nano     .config/kitty/kitty.conf
	kitty.conf:
```
enable_audio_bell no

include color.ini

font_family     HackNerdFont
font_size 12

disable_ligatures never

url_color #61afef

url_style curly

cursor_shape beam
cursor_beam_thickness 1.8

mouse_hide_wait 3.0
detect_urls yes

repaint_delay 10
input_delay 3
sync_to_monitor yes

background_opacity 0.95
tab_bar_syle powerline

shell zsh
```

for mac only:
```
copy_on_select yes
map cmd+c        copy_to_clipboard
map cmd+v        paste_from_clipboard
```

kitty info: 
https://sw.kovidgoyal.net/kitty/overview/


install powerlevel10k
	check github:
	https://github.com/romkatv/powerlevel10k
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
	echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

	nano ~/.pl10k.zsh
add: 
	typeset -g ....... LEFT
                command_execution_time
                context    
	
	typeset -g ....... RIGHT
	       comment all.

	sudo su
	ln -s -f /home/r4mp4k314/.zshrc /root/.zshrc
	usermod --shell /usr/bin/zsh root


	sudo pacman -S nvim
	

Install gnome-tweaks
	sudo pacman -S gnome-tweaks

	To enable the super key when running linux in a virtual machine in OSX
	
	set "overview shortcut" in tweaks to Right super .


Pentesting tooling:
	pacman -S speedtest-cli
	
	sudo su
	pacman -S burpsuite
	pacman -S python-pip responder nmap impacket  wfuzz gobuster
	pacman -S aircrack-ng
	pacman -S evil-winrm whatweb
	
	pacman -S metasploit
		msfconsole
	
	
	
	install https://github.com/rxyhn/yoru
	
		paru install not as root.

	paru -S awesome-git
	paru -Sy picom-git wezterm rofi acpi acpid acpi_call upower lxappearance-gtk3 \
jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift \
pipewire pipewire-alsa pipewire-pulse alsa-utils brightnessctl feh maim \
mpv mpd mpc mpdris2 python-mutagen ncmpcpp playerctl --needed
	
	Installing fonts:
	pacman -Sy wget
	sudo -su 
	cd /usr/share/fonts
	wget http://fontlot.com/downfile/5baeb08d06494fc84dbe36210f6f0ad5.105610
	pacman -S p7zip
	7z l 5baeb08d06494fc84dbe36210f6f0ad5.105610
	mv 5baeb08d06494fc84dbe36210f6f0ad5.105610 comprimido.zip
	unzip comprimido.zip
	find . | grep "\.ttf$" | while read line; do cp $line .; done
	
	download:
	https://dropbox.com/s/hrkub2yo9iapljz/iconmoo.zip?dl=0
	mv /home/downloads/icomoon.zip .
	unzip icomoon.zip
	mv icomoon/*.ttf
	rm -rf icomoon
	
	paru -S nerd-fonts-jetbrains-mono ttf-font-awesome ttf-font-awesome4 ttf-material-design-icons
	
	
	
	