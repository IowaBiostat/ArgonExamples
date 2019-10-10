# Do some pointless but potentially time consuming computation
args = commandArgs(trailingOnly=TRUE)
if (length(args) == 0){
  idx <- 1
} else {
  idx <- args[[1]]
}
fname <- paste0("output_", idx, ".txt")
cat("Results: \n", file = fname)
replicate(10, {X <- rnorm(1e7)
	       cat(paste0(mean(X), "\n"), 
                   file = fname, 
                   append = TRUE)})


