# FreeRDP Sessions
alias tdversio2110='xfreerdp +clipboard /smart-sizing /v:192.168.90.116 /u:Administrator /p:imagine /cert-ignore &!'
alias tddemo='xfreerdp +clipboard /sound:sys:pulse /smart-sizing /v:192.168.90.17 /u:Administrator /p:Digital1980 /cert-ignore &!'


# LIST COMMANDS
#list commands
alias ll='ls -altr ; pwd'
alias lldir='ls -altrFR ; pwd'
alias la='ls -A'
alias l='ls -CF'

# NAS MOUNTS
# Home 172 mount points
alias nasbtns='sudo mount -o resvport,rw -t nfs 172.16.1.105:/volume1/btns ~/Public/btns'
alias nasvideo='sudo mount -o resvport,rw -t nfs 172.16.1.105:/volume1/video ~/Private/video'
# Imagine Communications Technical Papers 
alias techpubs='cd "/Users/jamesrivers/Google Drive/My Drive/ImagineRef/techpubs"'

# USEFUL
#tmux start
alias t='zsh ~/GitFiles/mac_dotfiles/tmuxstart.sh'
## PDF Find love this tool - run pg follwed by key words or sequence and standback. 
alias pg='pdfgrep -iHnr'
# Another PF tool - view PDF in terminal
alias pdfview='lesspipe.sh $1 | less'
## MYIP 
alias myip='curl ipinfo.io && curl ifconfig.me/all'
## Find new files recently added
alias findnew='find -cmin +1  -cmin -2800'
#new ls using exa - brew install exa
alias l='exa'
alias ll='exa -al'
alias tree='exa -T'
alias tree-R='exa -TR'
#fzf 
alias fview='filepath=$(fzf); cat $filepath'
alias fpdf='filepath=$(fzf); lesspipe.sh $filepath | cat'
alias fedit='filepath=$(fzf); vim $filepath'
alias fpath="fzf --bind 'ctrl-y:execute-silent(pbcopy <<< {})+abort'"
alias f='fzf'
#white space killer 
alias wsk="zsh ~/GitFiles/mac_dotfiles/wsk.sh"
## Grep
alias drcl='grep -rnwil . -e'
alias drc='grep -rnwi . -e'
alias rglist='rg -i --max-count 1'
alias rgsnip='rg -i'
#cheatsheet
alias cht='curl cheat.sh/'
# cat replace with bat - brew install bat
alias cat='bat'
# new article creation 
alias nar='zsh ~/GitFiles/mac_dotfiles/newarticle/new_ref_article.sh'
alias nae='zsh ~/GitFiles/mac_dotfiles/newarticle/new_exp_article.sh'
alias nah='zsh ~/GitFiles/mac_dotfiles/newarticle/new_how_article.sh'
alias nat='zsh ~/GitFiles/mac_dotfiles/newarticle/new_tut_article.sh'
alias nz='zsh ~/GitFiles/mac_dotfiles/newzet/new_zet.sh'
alias weeks='ncal -w3'
alias clocks='~/GitFiles/cli_clocks/timedateworldedit.sh'
# GIT
alias g='git'
alias add='git add .'
alias commit='git commit -m'
alias push='git push'
alias pull='git pull'
alias acp='git add . && commit "Updated $(date)" && git push'
alias garch='git archive -o ~/Google\ Drive/My\ Drive/academy/"${PWD##*/}"/"${PWD##*/}"_$(date +"%Y-%m-%d").zip HEAD'
alias mp='git checkout main && git merge develop && git push'
alias dev='git checkout develop'
alias main='git checkout main'
alias issue="gh issue list --state "all""
alias issuestatus="gh issue status"
alias issuecreate="gh issue create"

## GIT Branches in terminal
autoload -Uz compinit && compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats " %F{green}%c%u(%b)%f %a"
zstyle ':vcs_info:*' stagedstr "%F{red}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if git --no-optional-locks status --porcelain 2> /dev/null | grep -q "^??"; then
    hook_com[staged]+="%F{red}"
  fi
}

## fzf and ripgrep
if type rg &> /dev/null; then
     export FZF_DEFAULT_COMMAND='rg --files'
       export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

setopt PROMPT_SUBST
export PROMPT='%n:%1~$vcs_info_msg_0_ %# '

##lesspipe 
export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s"


# MEDIA Links
## Home Cams
alias cams="mpv rtsp://admin@192.168.1.45/user=admin_password=tlJwpbo6_channel=1_stream=0.sdp --external-file=rtsp://admin@192.168.1.48/user=admin_password=tlJwpbo6_channel=1_stream=0.sdp  --external-file=rtsp://admin@192.168.1.43/user=admin_password=tlJwpbo6_channel=1_stream=0.sdp  --external-file=rtsp://admin@192.168.1.45/user=admin_password=tlJwpbo6_channel=1_stream=0.sdp  --lavfi-complex='[vid1] [vid2] hstack [t1] ; [vid3] [vid4] hstack [t2] ; [t1] [t2] vstack [vo]'"


## MUSIC
alias playbbcr1="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_one.m3u8'"
alias playbbcr2="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_med/ak/bbc_radio_two.m3u8'"
alias playbbcr4="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_fourfm.m3u8'"
alias playbbcr5l="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live.m3u8'"
alias playbbcr5lsx="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live_sports_extra.m3u8'"
alias playbbcr6="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8'"
alias playbbcws="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_med/ak/bbc_world_service.m3u8'"
alias playlbc="mpv 'http://icecast.thisisdax.com/LBCLondon'"
alias playzm="mpv 'https://ais-nzme.streamguys1.com/nz_008/playlist.m3u8'"
alias playlofiaudio="mpv 'https://www.youtube.com/watch?v=tCs48OFv7xA' --no-video"
alias playlofiaudio1="mpv 'https://www.youtube.com/watch?v=cbuZfY2S2UQ' --no-video"
alias playhack="mpv 'https://www.youtube.com/watch?v=_daTfgc4u3k' --no-video"

## VIDEO STREAMS
alias playbbcnews="mpv --ontop 'https://vs-hls-push-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_news_channel_hd/t=3840/v=pv14/b=5070016/main.m3u8'"
alias playimagine="mpv 'http://35.212.236.5/index.m3u8'"
alias playbloom="mpv 'https://www.youtube.com/watch?v=dp8PhLsUcFE' --ontop"
alias playiptv="mpv 'https://iptv-org.github.io/iptv/index.m3u'"
alias playnbcnews="mpv 'https://youtu.be/htFR37hKaSU'"
alias playskynews="mpv 'https://youtu.be/9Auq9mYxFEE'"
alias playaljaznews="mpv 'https://youtu.be/F-POY4Q0QSI'"
alias playlofi="mpv 'https://youtu.be/5qap5aO4i9A'"
alias playbbc3="mpv 'https://vs-hls-pushb-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_three_hd/t=3840/v=pv14/b=5070016/main.m3u8'"
alias playbbc4="mpv 'http://vs-hls-pushb-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_four_hd/mobile_wifi_main_sd_abr_v2_akamai_hls_live_http.m3u8'"
alias playbbc1="mpv 'https://vs-hls-push-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_one_hd/t=3840/v=pv14/b=5070016/main.m3u8'"
alias playbbc2="mpv 'http://vs-hls-pushb-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_four_hd/mobile_wifi_main_sd_abr_v2_akamai_hls_live_http.m3u8'"
alias playabc="mpv 'https://www.youtube.com/watch?v=w_Ma8oQLmSM' --ontop"


## ZSH SPECIFIC
alias mpv='/Applications/mpv.app/Contents/MacOS/mpv*'


# HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"
# TMUX Cheat Sheet
export PATH="~/GitFiles/:$PATH"

## Lynx 
alias '?'='~/GitFiles/mac_dotfiles/lynx/duck.sh'
alias '??'='~/GitFiles/mac_dotfiles/lynx/google.sh'

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit && compinit -i

# Add history date time and hide space entries for not listing in the history
# BASH Entry  - HISTTIMEFORMAT="%d/%m/%y %T "
alias history='history -E'
# BASH Entry HISTCONTROL=ignorespace
setopt HIST_IGNORE_SPACE
