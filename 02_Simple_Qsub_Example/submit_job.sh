#!/bin/bash
# "-pe smp 2": Single threaded program, just request 2 slot to get one full core
# "-cwd": Run this job in the current working directory
# "-e /dev/null -o /dev/null" Send the STDERR and STDOUT streams into the 
# abyss, instead of creating a bunch of clutter 
# (remove these options when debugging)
qsub -pe smp 2 -cwd -e /dev/null -o /dev/null simple.job 


