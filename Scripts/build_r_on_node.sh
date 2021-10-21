#!/bin/bash
qsub -pe smp 16 -cwd -e ./build.log -o ./build.log build_r_on_node.job
