#!/bin/bash
FOLDER=~/.local/share/fonts

if [ -d $FOLDER ]; then
    echo "Nothing to do as $FOLDER folder already exists"
    exit 0
fi

cd

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
