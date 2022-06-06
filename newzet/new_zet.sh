#!/bin/bash
cd ~/GitFiles/zet/
dir=$1
mkdir -v "$(date '+%Y%m%d%H%M%S')"
cd "$(date '+%Y%m%d%H%M%S')"
mkdir attachments
vim readme.md
