if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi
source /etc/profile.d/autojump.zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git archlinux autojump nyan pip python tmux git-extras)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.utf8
export TERM=xterm-256color
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/site_perl:/usr/bin/core_perl:/home/brendan/.local/bin/:/home/brendan/.gem/ruby/2.1.0/bin"
[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null
source /usr/bin/virtualenvwrapper.sh
[ -s "/home/brendan/.nvm/nvm.sh" ] && . "/home/brendan/.nvm/nvm.sh" # This loads nvm
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
alias srssh='cd /home/brendan/dev/sr/SimpleRelevance/;vagrant ssh'
alias srup='cd /home/brendan/dev/sr/SimpleRelevance/;vagrant up'
alias acmssh='ssh bpmoria2@linux1.acm.uiuc.edu'
alias lss='ls | sort'
alias srmux='source ~/.tmux/sr.conf'
alias lols='ls | /home/brendan/.gem/ruby/2.1.0/bin/lolcat'
alias wifi_up='sudo create_ap wlp3s0 enp0s25 ifiw wifi1234'
alias vpn_up='sudo systemctl start pia@CA_Toronto'
alias vpn_down='sudo systemctl stop pia@CA_Toronto'
alias winet='sudo netctl start wlp3s0-IllinoisNet'
alias bind_bt='sudo rfcomm bind 3 30:14:10:15:02:41'
alias setlight='sudo tee /sys/class/backlight/intel_backlight/brightness <<<'
alias ilnet='sudo netctl start wlp3s0-IllinoisNet'
alias rilnet='sudo netctl restart wlp3s0-IllinoisNet'
alias sl='ls'

# list permissions in numeric form.
alias lsperms="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
# from: https://help.github.com/articles/remove-sensitive-data/
# Removes all instances of $1 from git repository.
function gclobber()
{
 CLOBBER_FILE=$1
 git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch $CLOBBER_FILE' --prune-empty --tag-name-filter cat -- --all
}

if [ -f ~/.zsh-private ]; then source ~/.zsh-private; fi
