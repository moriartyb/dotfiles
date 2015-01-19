if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi
if [ -f /etc/profile.d/autojump.zsh ]; then source /etc/profile.d/autojump.zsh; fi
if  [ $HOST = "moriarty" ] && [ -f $HOME/dotfiles/zsh/laptop/.zsh-laptop ]
  then
    source $HOME/dotfiles/zsh/laptop/.zsh-laptop
fi

if [ -d $HOME/.oh-my-zsh ]
  then
    ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="agnoster"
    plugins=(git nyan pip python tmux git-extras)
    source $ZSH/oh-my-zsh.sh
fi


alias lss='ls | sort'
alias setlight='sudo tee /sys/class/backlight/intel_backlight/brightness <<<'
alias sl='ls'

# list permissions in numeric form.
alias lsperms="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
# from: https://help.github.com/articles/remove-sensitive-data/
# Removes all instances of $1 from git repository.
function gclobber()
{
 git filter-branch --force --index-filter "git rm --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all
}

if [ -f $HOME/.zsh-private ]; then source $HOME/.zsh-private; fi

alias drl='systemctl daemon-reload'

alias gpom='git push origin master'
alias gpum='git pull origin master'
