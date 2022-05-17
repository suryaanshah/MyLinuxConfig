# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

export ZSH="/home/suryaansh/.oh-my-zsh"
export EDITOR="nvim"

ZSH_THEME="fishy"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vrc="vim ~/.config/nvim/init.vim"
alias zrc="nvim ~/.zshrc"
alias i3rc="vim ~/.config/i3/config"
alias h="htop"
alias g="gotop"
alias camctl="v4l2-ctl -d /dev/video0 --list-ctrls"
alias campow="v4l2-ctl -d /dev/video0 --set-ctrl=power_line_frequency=1"
alias zoom_cam="v4l2-ctl -d /dev/video0 --set-ctrl=zoom_absolute="
alias c="clear"
alias q="exit"
alias la="ls -a"
alias ll="ls -l"
alias clip='tr -d "\n" | xclip -selection clipbaord'
alias rs='g++ solution.cpp -o cpp.out; ./cpp.out'
alias rt='g++ test.cpp -o cpp.out; ./cpp.out'
alias mine='/home/anurag/.program/trex/t-rex -a firopow -o stratum+tcp://asia-firo.2miners.com:8181 -u aLe4UJ7QoZBpHVAPwzdVqq14rFQFGH1wrS.PC -p x'
alias up='pio run --target upload'
alias sm='pio device monitor'
alias n='nvim'
alias du='/sbin/du -h'
alias mtp='aft-mtp-mount ~/mnt'
alias winmount='sudo mount /dev/nvme0n1p3 /win'
alias ani="ani -q worst"
alias ytdl="youtube-dl"

alias lofi="mpv --no-video 'https://www.youtube.com/watch?v=5qap5aO4i9A' "
alias hst="history | fzf | tr -d '\n'  | xclip -sel c"
alias mozart="mpv ~/Music/Mozart.m4a"
alias frc="nvim ~/.config/fish/config.fish"
alias vrc="nvim ~/.config/nvim/init.vim"
alias erc="nvim ~/.emacs.d/init.el"
alias t="tmux"
alias em="emacs"
alias trc="vim ~/.tmux.conf"
alias slack="flatpak run com.slack.Slack & disown"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvsuryaansh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:/var/lib/snapd/snap/bin:/home/suryaansh/.local/bin:/home/anurag/.program:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


[[ -s /home/anurag/.autojump/etc/profile.d/autojump.sh ]] && source /home/anurag/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
bindkey -v
