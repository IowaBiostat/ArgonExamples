#!/bin/bash
# "-pe smp 2": Single threaded program, just request 2 slot to get one full core
# "-cwd": Run this job in the current working directory
# "-t 1-20" run 20 of these jobs (array)
qsub -pe smp 2 -cwd -e /dev/null -o /dev/null -t 1-20 simple_args.job


