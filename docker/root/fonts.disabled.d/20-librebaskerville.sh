# -*- mode: sh; coding: utf-8-unix; -*-
# Name: Libre Baskerville
# License: SIL OFL 1.1
# License URL: https://github.com/impallari/Libre-Baskerville/blob/master/OFL.txt
curl -L -O https://github.com/impallari/Libre-Baskerville/archive/master.zip
unzip -q master.zip
mkdir -p /usr/share/fonts/opentype/librebaskerville
mv Libre-Baskerville-master/src/*.otf /usr/share/fonts/opentype/librebaskerville
mv Libre-Baskerville-master/*.txt /usr/share/fonts/opentype/librebaskerville
