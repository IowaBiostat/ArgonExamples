# Do some pointless but potentially time consuming computation
library(optparse)
option_list <- list(make_option(c("-o", "--output"), type = "character",
                    default = "results.txt", help = "Results file",
                    metavar = "character"))
opt_parser <- OptionParser(option_list= option_list)
opt <- parse_args(opt_parser)

cat("Results: \n", file = opt$output)
replicate(10, {X <- rnorm(1e7)
	       cat(paste0(mean(X), "\n"), 
                   file = opt$output, 
                   append = TRUE)})


