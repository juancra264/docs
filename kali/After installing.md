# After installing kali

Basic packages and modules:

```
sudo apt upgrade
sudo apt dist-upgrade -y
sudo apt dist-upgrade -y
sudo apt-get full-upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoremove -y
sudo apt autoclean -y
```

```
sudo apt install firmware-linux -y
sudo apt install bmon -y
sudo apt install htop -y
sudo apt install iperf3 -y
sudo apt install kitty -y
sudo apt install speedtest-cli -y
sudo apt install wireshark -y
sudo apt install git -y
sudo apt install tmux -y
sudo apt install python3 python3-pip -y
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
sudo apt install sublime-text -y
```

## Enable SSH Server
```
sudo apt install openssh-server -y
sudo systemctl start ssh
sudo systemctl enable ssh
```

## Configure Local firewall
```
sudo apt install ufw -y
sudo ufw enable
```

## Optimize Power Management
```
sudo apt install tlp -y
```

## Install security packages
```
sudo apt install tilix maltego metasploit-framework burpsuite wireshark aircrack-ng hydra nmap beef-xss nikto -y
```