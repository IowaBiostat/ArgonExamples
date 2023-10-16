#!/bin/bash
# Set R version
RVERS=R-4.3.1
CWD=$(pwd)
# Ensure bash profile exists
touch ~/.bash_profile
# Update path
echo "PATH=\$PATH:$CWD/$RVERS/bin" >>  ~/.bash_profile
echo 'module load stack/2021.1' >> ~/.bash_profile
echo 'module load gcc/9.3.0' >> ~/.bash_profile
echo 'module load python/3.8.8_gcc-9.3.0' >> ~/.bash_profile
echo 'module load pcre2'>> ~/.bash_profile
echo 'module load curl'>> ~/.bash_profile

echo 'export PATH' >> ~/.bash_profile
#
