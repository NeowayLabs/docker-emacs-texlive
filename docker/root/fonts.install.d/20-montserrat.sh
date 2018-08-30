# -*- mode: sh; coding: utf-8-unix; -*-
# Name: Montserrat
# License: SIL OFL 1.1
# License URL: https://github.com/JulietaUla/Montserrat/blob/master/OFL.txt
curl -L -O https://github.com/JulietaUla/Montserrat/archive/v7.200.tar.gz
tar xvf v7.200.tar.gz
mv Montserrat-7.200/fonts/otf /usr/share/fonts/opentype/montserrat
mv Montserrat-7.200/*.txt /usr/share/fonts/opentype/montserrat
