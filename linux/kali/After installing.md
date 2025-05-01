# After installing kali

## Enable SSH Server
```
sudo apt install openssh-server -y
```
```
sudo systemctl start ssh
```
```
sudo systemctl enable ssh
```

## Basic packages and modules:

```
sudo apt upgrade
```
```
sudo apt dist-upgrade -y
```
```
sudo apt-get full-upgrade -y
```
```
sudo apt autoremove -y
```
```
sudo apt autoclean -y
```
```
sudo apt install firmware-linux bmon htop iperf3 kitty speedtest-cli wireshark git tmux python3 python3-pip -y
```

## Installing Brave

```
sudo curl -fsS https://dl.brave.com/install.sh | sh
```

## Installing OMZ

```
sudo apt-get install -y zsh zsh-syntax-highlighting zsh-autosuggestions -y
```

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```
cp /etc/skel/.zshrc ~/.zshrc
```
```
zsh --version
```
```
which zsh\n
```
```
chsh -s $(which zsh)
```

## Installing Powerlevel10k

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

```
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

## Installing Sublime Text

```
wget -O - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/sublimehq.gpg > /dev/null
```

```
echo "deb [signed-by=/usr/share/keyrings/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
```

```
sudo apt update
```
```
sudo apt install sublime-text -y
```

## Configure Local firewall
```
sudo apt install firewalld -y
```
```
sudo systemctl start firewalld
```
```
sudo systemctl enable firewalld
```

## Optimize Power Management
```
sudo apt install tlp -y
```

## Install security packages
```
sudo apt install tilix maltego metasploit-framework burpsuite wireshark aircrack-ng hydra nmap beef-xss nikto -y
```