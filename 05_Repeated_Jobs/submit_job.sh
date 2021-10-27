#!/bin/bash
# "-pe smp 2": Single threaded program, just request 2 slot to get one full core
# "-cwd": Run this job in the current working directory
qsub -pe smp 2 -cwd -e /dev/null -o /dev/null simulation_batch.job $1 



