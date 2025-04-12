alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fetch='fastfetch'

function lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

function user-mount(){
    udisksctl mount --block-device /dev/$1
}

function user-umount(){
    udisksctl unmount --block-device /dev/$1
}
