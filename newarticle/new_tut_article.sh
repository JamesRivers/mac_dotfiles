#!/bin/zsh
echo New article file name...
read artvar
mkdir -p "tut_$artvar/attachments"
cd "tut_$artvar"
cp ~/GitFiles/mac_dotfiles/newarticle/note2.md .
mv note2.md  $(date '+%Y%m%d%H%M')_tut_$artvar.md
sed -i '' -e "s+Title : testing_template+Title : tut_$artvar+g" $(date '+%Y%m%d%H%M')_tut_$artvar.md
sed -i '' -e "s+datecreate+$(date '+%Y-%m-%d')+g" $(date '+%Y%m%d%H%M')_tut_$artvar.md
vim $(date '+%Y%m%d%H%M')_tut_$artvar.md
