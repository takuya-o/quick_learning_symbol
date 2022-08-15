#!/bin/sh
set -ue

npm install
npx md-to-pdf [0-9]*.md

if [ -x /usr/bin/pdftk ];then
  pdftk [0-9]*.pdf output quick_learning_symbol.pdf
fi
