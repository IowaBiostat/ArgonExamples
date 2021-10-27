source("../Scripts/sge_interface.R")
target_samples <- 1000
simultaneous_jobs <- 10
hawkid <- "gown"

if (!dir.exists("output")){
    dir.create("output")
}
# Function to get current number of samples
current_samples <- function(){
    files = dir("./output")
    if (length(files) == 0){
        return(0)
    }
    Reduce("+", lapply(files, function(fname){
	    print(fname)
	    nrow(read.csv(paste0("./output/", fname)))
    }))
}

# Function to get current number of completed batches
current_batches <- function(){
 length(dir("./output"))
}

# Function to wait until all jobs finish
wait_until_finished <- function(hawkid, delay = 5){
    current_jobs <- nrow(get_jobs(hawkid))

    # Wait for all current jobs to finish
    while (current_jobs > 0){
        Sys.sleep(delay)
        current_jobs <- nrow(get_jobs(hawkid))
    }
    return(0)
}

wait_until_finished(hawkid)
batch_num <- current_batches() + 1

# Find the current number of samples
nsamp <- current_samples()
while (nsamp < target_samples){
    print("Submitting a round of jobs")
    for (i in 1:simultaneous_jobs){
      system(paste0("./submit_job.sh ", batch_num), 
 			intern = FALSE)
      batch_num <- batch_num + 1
    }
    wait_until_finished(hawkid)
    nsamp <- current_samples()
}

wait_until_finished(hawkid)

print("Requested samples complete")
write.csv(Reduce("rbind", lapply(dir("./output"), function(fname){
	read.csv(paste0("./output/", fname))})),
        row.names=FALSE,quote=FALSE,
        file = "final_output.csv")

