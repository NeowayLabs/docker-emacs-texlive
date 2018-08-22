# -*- mode: sh; coding: utf-8-unix; -*-
# Name: Libre Caslon Text
# License: SIL OFL 1.1
# License URL: https://github.com/impallari/Libre-Caslon-Text/blob/master/OFL.txt
curl -L -O https://github.com/impallari/Libre-Caslon-Text/archive/master.zip
unzip -q master.zip
mv Libre-Caslon-Text-master/fonts/OTF /usr/share/fonts/opentype/librecaslontext
mv Libre-Caslon-Text-master/OFL.txt /usr/share/fonts/opentype/librecaslontext
