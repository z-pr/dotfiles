# .dotfiles

---

* Clone repo
```bash
git clone git@github.com:pktyz/dotfiles.git ~/.dotfiles
```
* Install utils
```bash
brew install fzf
brew install jq
brew install zoxide
brew install go
brew install rust
brew install npm
brew install neofetch
brew install docker
brew install yazi
brew install tmux
brew install stow
brew install ripgrep
brew install --cask alt-tab
brew install --cask keepingyouawake
brew install --cask kitty
brew install --cask raycast
brew install --cask arc
```
* [Install](https://github.com/Homebrew/brew/releases/latest) brew (macOS)
* Install neovim
```bash
brew install neovim
```
* Install yabai && skhd
```bash
brew install koekeishiya/formulae/yabai && brew install koekeishiya/formulae/skhd
```
* Start yabai and skhd
```bash
yabai --start-service && skhd --start-service
```
* Install Nerd fonts
```bash
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-pro
brew install --cask sf-symbols
```
* Install sketchybar app icons font
```bash
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
```
* Install and start sketchybar
```bash
brew tap FelixKratz/formulae
brew install sketchybar
brew services start sketchybar
```
