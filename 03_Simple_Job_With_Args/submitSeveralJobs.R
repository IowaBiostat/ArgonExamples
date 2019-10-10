for (i in 1:10){
  system("./submit_job.sh --output=", paste0("output_", i, ".txt"))
}

