# After installing kali

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
```


Installing Brave

```
sudo curl -fsS https://dl.brave.com/install.sh | sh
```


Installing omz

```
sudo apt-get install -y zsh zsh-syntax-highlighting zsh-autosuggestions -y
```

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```
cp /etc/skel/.zshrc ~/.zshrc
```

Verification
```
chsh -s /bin/zsh
zsh --version
which zsh\n
chsh -s $(which zsh)
```

Installing Powerlevel10k

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

```
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```