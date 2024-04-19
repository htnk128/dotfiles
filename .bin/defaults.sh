#!/bin/bash

set -eu

# Dock
## 自動的に隠す
defaults write com.apple.dock autohide -bool true
## 表示を高速化
defaults write com.apple.dock autohide-time-modifier -int 0.1
defaults write com.apple.Dock autohide-delay -float 0
## 拡大しない
defaults write com.apple.dock magnification -bool false
## 最近使ったアプリを表示しない
defaults write com.apple.dock show-recents -bool false
# 開いているアプリケーションのインジケータライトを表示する
defaults write com.apple.dock show-process-indicators -bool true
## Dockを右側に移動
defaults write com.apple.dock orientation -string "left"

# Finder
## リストビューをデフォルトにする
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
## 不可視ファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool false
## パスを表示
defaults write com.apple.finder ShowPathbar -bool true

# トラックパッド
## タップでクリックを有効化
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
## スクロール方向をナチュラルに
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Keyboard
## 入力の先頭文字を大文字にしない
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Menu
## バッテリー残量のパーセント表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
## 日付と時刻のフォーマット
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"

# Other
## 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## 外観モードをダークにする
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

## 設定反映
for app in \
	"Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "$app" &> /dev/null || true
done
