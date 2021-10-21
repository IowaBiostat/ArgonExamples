

get_jobs <- function(uid){
	job_rslt <- system(paste0("qstat -u ", uid), intern = TRUE)
	
	if (length(job_rslt) <= 2){
		return(data.frame(`job-ID`=integer(0), 
		                  prior=numeric(0),
		                  name=character(0), 
		                  user=character(0), 
		                  state=character(0), 
		                  `submit/start`=character(0), 
		                  at=character(0), 
		                  queue=character(0), 
		                  slots=character(0), 
		                  `ja-task-ID`=integer(0)))
	} else{
	  field_names <- setdiff(strsplit(gsub("^ *|(?<= ) | *$", "", job_rslt[1], perl = TRUE), split = " ")[[1]], "at")
		out <- as.data.frame(Reduce("rbind", lapply(job_rslt[3:length(job_rslt)], function(jr){
		  matrix(strsplit(gsub("^ *|(?<= ) | *$", "", jr, perl = TRUE), split = " ")[[1]], nrow=1)
		})))
		colnames(out) <- field_names
		out$`job-ID` <- as.integer(out$`job-ID`)
		out$prior <- as.numeric(out$prior)
		out$`ja-task-ID` <- as.integer(out$`ja-task-ID`)
	}
  out
}
