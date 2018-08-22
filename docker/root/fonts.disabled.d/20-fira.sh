# -*- mode: sh; coding: utf-8-unix; -*-
# Name: Fira Sans & Fira Mono
# License: SIL OFL 1.1
# License URL: https://github.com/mozilla/Fira/blob/master/LICENSE
curl -L -O https://github.com/mozilla/Fira/archive/4.106.tar.gz
tar xzf 4.106.tar.gz
mkdir -p /usr/share/fonts/opentype/fira{sans,mono}
mv Fira-4.106/otf/FiraSans-* /usr/share/fonts/opentype/firasans
mv Fira-4.106/otf/FiraMono-* /usr/share/fonts/opentype/firamono
