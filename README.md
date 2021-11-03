# ArgonExamples
A repository with some minimal, self-contained examples of using the Argon HPC cluster

More detailed instructions can be found on the main HPC documentation site [here](https://wiki.uiowa.edu/display/hpcdocs/Cluster+Systems+Documentation), as well as on our [Biostatistics HPC Tutorial website](https://iowabiostat.github.io/hpc/).

Nevertheless, these extremely minimal examples may prove useful. The `./Scripts` folder also provides an easy shortcut to download, compile, and configure (via `.bash_profile`) the latest versions of R and Julia. 

## Installation Scripts

To compile the latest version of R using an Argon compute node, simply clone this repository, go to the scripts directory, and run the compilation script:

```
git clone https://github.com/IowaBiostat/ArgonExamples.git
cd ./ArgonExamples/Scripts
./build_r_on_node.sh
```

Once your job has finished running, you will be able to add this user-compiled version of R to your `PATH` via the `.bash_profile` configuration file by running:

```
./add_R_to_bash_profile.sh
```

In addition, you can download and configure the latest Julia by simply running:

```
./get_julia.sh
```

**Note: ** To install packages on Julia, you may first need to empty the `LD_LIBRARY_PATH` environment variable by running:

`export LD_LIBRARY_PATH=""`

The following examples showcase some common patterns of job submission on Argon. 

## Example 1: 

In the folder `./01_Minimal_Login_Example`, you will find a script called `minimal_login_node.sh`. This script executes the qlogin command to obtain an interactive session on a commpute node with 4 slots. 

## Example 2:

In this folder you will find several files. The script `submit_job.sh` will submit a job to be run (contained in `simple.job`) on a compute node with 2 slots. The actual work is done in the `simple_job.R` file, which creates a dummy output file. 

## Example 3:

This example showcases one method of passing arguments to your R script. You will need to install the `optparse` library before executing this script. An example of how to execute this script would be:

`./submit_job.sh my_output_file.txt`

This folder also contains an R script  called `submit_several_jobs.R`, which illustrates how you can use R to submit multiple distinct jobs. 

## Example 4: 

This example uses the array submission syntax to submit multiple jobs. Simply call `./submit_job.sh` and see how the `$SGE_TASK_ID` is used to receive the job indiex. Also note that the R script in this folder does not rely on a package to receive command line arguments. 

## Example 5:

This is a more advanced script, and pulls in a utility function from the `Scripts` folder which programmatically handles the output of qsub. It will need to be configured for 
your own hawk-ID, and will only work if no other jobs are being run under your account. 

The goal of this script is to continue automatically submitting jobs until a required number of successful draws are obtained. Needless to say, automated scripting against the Argon HPC cluster requires VERY CAREFUL ATTENTION, 
or you will risk hogging resources and degrading the service for other users. 
