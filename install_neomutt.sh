#!/bin/bash
set -e

git clone https://github.com/neomutt/neomutt.git --depth 1 -b neomutt-20171027
cd neomutt
sudo apt-get -y install autoconf autopoint libnotmuch-dev liblmdb-dev libssl-dev lynx xsltproc urlview links msmtp libncursesw5-dev offlineimap libtokyocabinet-dev
autoreconf --install
./configure --enable-notmuch --enable-locales-fix --with-tokyocabinet --with-ssl
make
sudo make install
cd ..
rm -rf neomutt
