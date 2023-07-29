# vim like
bindkey -v

if [ -e /opt/homebrew/bin/brew ]; then
  export PATH=$PATH:/opt/homebrew/bin
fi

# aliases
source ~/.zsh_alias

# zsh基本設定
export LANG=ja_JP.UTF-8

# editor
export EDITOR=vim

export TERM='xterm-256color'

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# brewでインスコしたやつのzsh補完リンク設定
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit && compinit -u

# zsh: no matches found対策
setopt nonomatch

# cd無しでcd
setopt auto_cd

# cdでタブするとディレクトリ一覧を表示
setopt auto_pushd

# UTF-8環境での日本語対応
setopt print_eight_bit

# スペルチェック(nyae)禁止
unsetopt correct_all

# 補完候補を詰める
setopt list_packed

# カッコの補完
setopt auto_param_keys

# ディレクトリ名補完で末尾にスラッシュを付与
setopt auto_param_slash

# 直前のコマンドの重複を削除
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 同時に起動したzshの間でヒストリを共有
setopt share_history

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# emacs like keybind
bindkey "^A" beginning-of-line
bindkey "^B" backward-char
bindkey "^D" delete-char-or-list
bindkey "^E" end-of-line
bindkey "^F" forward-char
bindkey "^G" send-break
bindkey "^K" kill-line
bindkey "^L" clear-screen
bindkey "^N" history-substring-search-down
bindkey "^O" accept-line-and-down-history
bindkey "^P" history-substring-search-up
bindkey "^S" history-incremental-pattern-search-forward
bindkey "^T" transpose-chars

# プログラム関連の設定をロード
if [ -e ~/.zsh_program ]; then
    source ~/.zsh_program
fi

# その端末固有の設定をロードする
if [ -e ~/.zsh_local ]; then
    source ~/.zsh_local
fi

# プロンプトの設定
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

autoload colors
colors

P_CDIR="%B%F{cyan}%~%f%b"
P_VCS="%F{green}%1v%f"
PROMPT="
%F{magenta}%n%f@%F{yellow}$HOST%f:$P_CDIR $P_VCS
$ "

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# peco
if [ -e ~/.zsh_peco ]; then
    source ~/.zsh_peco
fi
