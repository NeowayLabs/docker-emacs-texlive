# -*- mode: sh; coding: utf-8-unix; -*-
# Name: Barlow
# License: SIL OFL 1.1
# License URL: https://github.com/jpt/barlow/blob/master/OFL.txt
curl -L -O https://github.com/jpt/barlow/archive/master.zip
unzip -q master.zip
mv barlow-master/fonts/otf /usr/share/fonts/opentype/barlow
mv barlow-master/OFL.txt /usr/share/fonts/opentype/barlow
