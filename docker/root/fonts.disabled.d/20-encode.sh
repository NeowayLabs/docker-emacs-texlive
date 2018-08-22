# -*- mode: sh; coding: utf-8-unix; -*-
# Name: Encode Sans
# License: SIL OFL 1.1
# License URL: https://github.com/impallari/Encode-Sans/blob/master/OFL.txt
curl -L -O https://github.com/impallari/Encode-Sans/archive/master.zip
unzip -q master.zip
mv Encode-Sans-master/fonts /usr/share/fonts/truetype/encodesans
mv Encode-Sans-master/OFL.txt /usr/share/fonts/opentype/encodesans
