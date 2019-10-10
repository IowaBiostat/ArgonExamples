# Do some pointless but potentially time consuming computation
cat("Results: \n", file = "results.txt")
replicate(10, {X <- rnorm(1e7)
	       cat(paste0(mean(X), "\n"), 
                   file = "results.txt", 
                   append = TRUE)})


