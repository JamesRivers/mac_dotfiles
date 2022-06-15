#!/bin/zsh
echo New article file name...
read artvar
mkdir -p "how_$artvar/attachments"
cd "how_$artvar"
cp ~/GitFiles/mac_dotfiles/newarticle/note2.md .
mv note2.md  $(date '+%Y%m%d%H%M')_how_$artvar.md
sed -i '' -e "s+Title : testing_template+Title : how_$artvar+g" $(date '+%Y%m%d%H%M')_how_$artvar.md
sed -i '' -e "s+datecreate+$(date '+%Y-%m-%d')+g" $(date '+%Y%m%d%H%M')_how_$artvar.md
vim $(date '+%Y%m%d%H%M')_how_$artvar.md
