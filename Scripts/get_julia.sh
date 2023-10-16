#!/bin/bash
JVERS=julia-1.9.3
wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/$JVERS-linux-x86_64.tar.gz
tar -xzf $JVERS-linux-x86_64.tar.gz

CWD=$(pwd)
# Ensure bash profile exists
touch ~/.bash_profile
# Update path
echo "PATH=\$PATH:$CWD/$JVERS/bin" >>  ~/.bash_profile
echo 'module load stack/2022.2' >> ~/.bash_profile
echo 'export PATH' >> ~/.bash_profile

