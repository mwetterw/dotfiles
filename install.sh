function install_rcm()
{
    version=1.3.0
    curl -LO https://thoughtbot.github.io/rcm/dist/rcm-"$version".tar.gz && \

    tar -xvf rcm-"$version".tar.gz && \
    cd rcm-"$version" && \

    ./configure --prefix="$HOME"/.local && \
    make && \
    make install && \

    cd .. && \
    rm -rf rcm-"$version"*
}

function initial_setup()
{
    env RCRC=$HOME/.dotfiles/rcrc PATH=$HOME/.local/bin:$PATH rcup -f
    exec bash
}


which rcup &> /dev/null
if [ $? -ne 0 ]; then
    install_rcm
fi

initial_setup
