#!/bin/bash
set -e

git clone https://github.com/neomutt/neomutt.git --depth 1 -b neomutt-20161028
cd neomutt
sudo apt-get install autoconf libnotmuch-dev liblmdb-dev libssl-dev lynx xsltproc urlview links msmtp libncursesw5-dev offlineimap
autoreconf --install
./configure --enable-sidebar --enable-notmuch --enable-hcache --enable-imap --with-ssl --enable-locales-fix
make
sudo make install
cd ..
rm -rf neomutt
