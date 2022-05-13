#!/bin/zsh
echo New article file name...
read artvar
cp ~/GitFiles/mac_dotfiles/newarticle/note2.md .
mv note2.md  $(date '+%Y%m%d%H%M')_$artvar.md
sed -i '' -e "s+Title : testing_template+Title : $artvar+g" $(date '+%Y%m%d%H%M')_$artvar.md
sed -i '' -e "s+datecreate+$(date '+%Y-%m-%d')+g" $(date '+%Y%m%d%H%M')_$artvar.md

