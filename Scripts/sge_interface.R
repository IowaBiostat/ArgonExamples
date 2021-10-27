library(XML)

get_jobs <- function(uid){
	job_rslt <- xmlToList(system(paste0("qstat -u ", uid, " -xml"), intern = TRUE))
 		
	if (length(names(job_rslt$queue_info)) == 0){
		return(data.frame(jobID=integer(0), 
		                  state=character(0), 
		                  submitted=character(0), 
		                  queue=character(0), 
		                  slots=character(0)))
	} else{


	return(Reduce("rbind", lapply(1:length(names(job_rslt$queue_info)), function(i){
		data.frame(jobID = job_rslt$queue_info[[i]]$JB_job_number, 
			   state = job_rslt$queue_info[[i]]$state, 
			   submitted = job_rslt$queue_info[[i]]$JAT_start_time,
                           queue =  job_rslt$queue_info[[i]]$queue_name,
                           slots =  job_rslt$queue_info[[i]]$slots)
	})))
    
}
