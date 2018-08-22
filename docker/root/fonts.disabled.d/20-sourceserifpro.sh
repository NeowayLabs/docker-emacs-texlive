# -*- mode: sh; coding: utf-8-unix; -*-
# Name: Adobe Source Serif Pro
# License: SIL OFL 1.1
# License URL: https://github.com/adobe-fonts/source-serif-pro/blob/master/LICENSE.md
curl -L -O https://github.com/adobe-fonts/source-serif-pro/archive/2.000R.tar.gz
tar xzf 2.000R.tar.gz
mv source-serif-pro-2.000R/OTF /usr/share/fonts/opentype/sourceserifpro
mv source-serif-pro-2.000R/LICENSE.txt /usr/share/fonts/opentype/sourceserifpro
