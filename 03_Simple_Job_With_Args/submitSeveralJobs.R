for (i in 1:10){
  print(i)
  system(paste0("./submit_job.sh --output=", paste0("output_", i, ".txt")), intern = FALSE)
}

