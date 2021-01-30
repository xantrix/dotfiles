# dotfiles

## Requirements

 - [git](https://git-scm.com/)
 - [stow](https://www.gnu.org/software/stow/manual/stow.html)
 - [fc-cache](http://refspecs.linuxbase.org/LSB_3.1.0/LSB-Desktop-generic/LSB-Desktop-generic/fc-cache.html)
 - [zsh](https://www.zsh.org/) 
 - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
 - [zsh-theme-powerlevel10k](https://github.com/romkatv/powerlevel10k) (zsh theme)

### Optional requirements
 - [fzf](https://github.com/junegunn/fzf)
 - [kitty](https://github.com/kovidgoyal/kitty)
 - [Visual Studio Code](https://code.visualstudio.com/)

### Arch Linux Setup
```
pacman -S git stow zsh zsh-theme-powerlevel10k fzf kitty
yay visual-studio-code-bin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/xantrix/dotfiles/master/install.sh)
```

## Keyboard shortcuts
### zsh + plugins
Ctrl+R global history 
Ctrl+G per-dir history

### Kitty
https://sw.kovidgoyal.net/kitty/conf.html

### Tmux
https://tmuxcheatsheet.com/

### Vim
https://vim.rtorr.com/
