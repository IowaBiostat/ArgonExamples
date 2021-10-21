#!/bin/bash
# Set R version
RVERS=R-4.1.1
CWD=$(pwd)
# Ensure bash profile exists
touch ~/.bash_profile
# Update path
echo "PATH=\$PATH:$CWD/$RVERS/bin" >>  ~/.bash_profile
echo 'module load python/3.7.0' >> ~/.bash_profile
echo 'module load gcc/8.3.0' >> ~/.bash_profile
echo 'export PATH' >> ~/.bash_profile
#
