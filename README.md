# neutonfoo dotfiles

1. Install Homebrew

https://brew.sh/

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
2. Install FireCode Nerd Font

https://www.nerdfonts.com/font-downloads

2. Install Oh My Zsh

https://github.com/ohmyzsh/ohmyzsh

```sh
sh -c "\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## powerlevel10k

https://github.com/romkatv/powerlevel10k

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

## zsh-autosuggestions

https://github.com/zsh-users/zsh-autosuggestions

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
