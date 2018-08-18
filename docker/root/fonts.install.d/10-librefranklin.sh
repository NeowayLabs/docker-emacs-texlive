# -*- mode: sh; coding: utf-8-unix; -*-
# Name: Libre Franklin
# License: SIL OFL 1.1
# License URL: https://github.com/impallari/Libre-Franklin/blob/master/OFL.txt
curl -L -O https://github.com/impallari/Libre-Franklin/archive/master.zip
unzip -q master.zip
mv Libre-Franklin-master/fonts/OTF /usr/share/fonts/opentype/librefranklin
mv Libre-Franklin-master/*.txt /usr/share/fonts/opentype/librefranklin
