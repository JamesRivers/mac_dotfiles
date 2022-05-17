# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Add git branch if its present to PS1

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### TDUBUNTU ALIAS
alias awsvpn='openvpn3 session-start --config /home/imagine/Dowloads/client.ovpn'
alias awsvpnlist='openvpn3 sessions-list'
alias rdpawsjump='xfreerdp +clipboard /smart-sizing /v:172.31.78.237 /u:Administrator /p:"&o*O@;JFnE*6A3G=e4f(HjPMs=&NUJU;"'
### ALIAS ADDITIONAL
alias g='git'
alias main='git checkout main'
alias dev='git checkout develop'
alias mp='git checkout main && git merge develop && git push'
alias zet="echo "$(date +%Y%m%d%H%M)""
alias issuecreate="gh issue create"
alias issue="gh issue list --state "all""
alias issuestatus="gh issue status"
alias na='bash ~/GitFiles/mac_dotfiles/newarticle/new_article.sh'  
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


## VIDEO STREAMS
alias playbbcnews="mpv --ontop 'https://vs-hls-push-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_news_channel_hd/t=3840/v=pv14/b=5070016/main.m3u8'"
alias playimagine="mpv 'http://35.212.236.5/index.m3u8'"
alias playbloom="mpv 'https://liveproduseast.global.ssl.fastly.net/btv/desktop/us_live.m3u8'"
alias playiptv="mpv 'https://iptv-org.github.io/iptv/index.m3u'"
alias playnbcnews="mpv 'https://youtu.be/htFR37hKaSU'"
alias playskynews="mpv 'https://youtu.be/9Auq9mYxFEE'"
alias playaljaznews="mpv 'https://youtu.be/F-POY4Q0QSI'"
alias playlofi="mpv 'https://youtu.be/5qap5aO4i9A'"
alias playbbc3="mpv 'https://vs-hls-pushb-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_three_hd/t=3840/v=pv14/b=5070016/main.m3u8'"
alias playbbc4="mpv 'http://vs-hls-pushb-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_four_hd/mobile_wifi_main_sd_abr_v2_akamai_hls_live_http.m3u8'"
alias playbbc1="mpv 'https://vs-hls-push-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_one_hd/t=3840/v=pv14/b=5070016/main.m3u8'"
alias playbbc2="mpv 'http://vs-hls-pushb-uk-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_four_hd/mobile_wifi_main_sd_abr_v2_akamai_hls_live_http.m3u8'"

