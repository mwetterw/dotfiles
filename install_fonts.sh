#!/bin/bash
FOLDER=~/.local/share/fonts

if [ -d $FOLDER ]; then
    echo "Nothing to do as $FOLDER folder already exists"
    exit 0
fi

cd

# Chinese fonts for simplified and traditional Chinese (Firefox)
# Serif: WenQuanYi Micro Hei
# Sans-Serif: Noto Sans CJK SC (TC for traditional)
# Mono: Noto Sans Mono CJK SC (TC for traditional)
# sudo apt install -y fonts-wqy-microhei fonts-wqy-zenhei fonts-noto-cjk
# pacman -S wqy-microhei wqy-zenhei noto-fonts-cjk

echo "Cloning fonts repository..."
git clone https://github.com/powerline/fonts.git

echo "Installing fonts..."
./fonts/install.sh

echo "Deleting repository..."
rm -rf fonts

cd $FOLDER

echo "Generating fontscale..."
mkfontscale

echo "Generating fontdir..."
mkfontdir

echo "Loading font folder to X..."
xset +fp $FOLDER
