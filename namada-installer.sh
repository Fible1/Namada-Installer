#!/bin/bash
echo "I am the Namada installer!"
read -p "Are you on Ubuntu 22.04? (yes/no): " ubuntu_check

case $ubuntu_check in
    [yY][eE][sS]|[yY])
        echo "Installing dependencies..."
        export DEBIAN_FRONTEND=noninteractive
        
        cd
        
        sudo apt update && sudo apt upgrade -y
        sudo apt-get install libudev-dev -y
        sudo apt install protobuf-compiler -y
        sudo apt install golang -y
        sudo apt install curl tar wget clang pkg-config libssl-dev libclang-dev -y
        sudo apt install jq build-essential bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y
        sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
        . $HOME/.cargo/env
        sudo apt install Node.js 
        sudo apt install npm 
        
        read -p "Do you wish to install Namada and Tendermint now? (yes/no): " install_check
        case $install_check in
            [yY][eE][sS]|[yY])
        
                cd
                git clone https://github.com/anoma/namada
        
                cd namada
                git checkout $NAMADA_TAG
                make build-release
               
                cd
                git clone https://github.com/heliaxdev/tendermint
               
                cd tendermint
                git checkout $TM_HASH
                make build
               
                cd
               
                cp $HOME/tendermint/build/tendermint /usr/local/bin/
                cp $HOME/namada/target/release/namada /usr/local/bin/
                cp $HOME/namada/target/release/namadac /usr/local/bin/
                cp $HOME/namada/target/release/namadan /usr/local/bin/
                cp $HOME/namada/target/release/namadaw /usr/local/bin/
                if [ $? -eq 0 ]; then
                    echo "Namada installed, and works, yay!"
                else
                    echo "Build failed!"
                fi
                ;;
            *)
                echo "Only dependencies installed"
                exit 0
                ;;
        esac
        ;;
    *)
        echo "This script only works on Ubuntu 22.04!"
        exit 1
        ;;
esac
