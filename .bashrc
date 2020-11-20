# Terminal Colors
# palette = ['#1F2428', '#FF1A5F', '#18DF97', '#FCE94F', '#FF9D6A', '#CE9BFF', '#00CAFE', '#EEEEEE']
#              black       red         green    yellow    orange      purple      blue       white
# \[\033[01;3{n}m\] where n between 0-9 i.e. index of color in palette



# showing git branch in the terminal
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1='\[$(printf "%*s" $(($(tput cols)-19)) "" | sed "s/ / /g")\[\033[01;35m\][\d \A]\r${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\[\033[01;33m\] $(parse_git_branch)'
    PS1+='\n\[\033[00;32m\]└─\[\033[00;39m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
