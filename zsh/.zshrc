if [[ -r /lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi
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

PATH="/home/brendan/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/brendan/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/brendan/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/brendan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/brendan/perl5"; export PERL_MM_OPT;
# searches the full text of the man pages"
alias mans="man -K"


# alias for mdb, microchip's command line debugger:
alias mdb="/opt/microchip/mplabx/mplab_ide/bin/mdb.sh"


# usage: gpdfmerge in1.pdf in2.pdf out.pdf
function gpdfmerge()
{
  (( length = $# - 1 ))
  GPDF_INPUT=(${@:1:$length})
  # echo $($GPDF_INPUT)
  gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=${@: -1} $GPDF_INPUT
}

function wotd()
{
  python2 -c "from wordnik import *;import os;\
  client = swagger.ApiClient(os.environ['WORDNIK_API_KEY'], 'http://api.wordnik.com/v4');words_api = WordsApi.WordsApi(client);\
  wotd=words_api.getWordOfTheDay();print 'Word of the Day:\n{0}\n-----------\n{1}\n\nExample:{2} '.format(wotd.word,wotd.definitions[0].text,wotd.examples[0].text)"
}

alias nmilnet='nmcli c up IllinoisNet'
alias nmrilnet='nmcli c down IllinoisNet;nmcli c up IllinoisNet;'
