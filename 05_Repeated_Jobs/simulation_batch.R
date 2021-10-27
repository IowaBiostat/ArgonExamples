# Do some pointless but potentially time consuming computation
library(optparse)
option_list <- list(make_option(c("-s", "--seed"), type = "integer",
                    default = 123123, help = "Results file",
                    metavar = "random seed"))
opt_parser <- OptionParser(option_list= option_list)
opt <- parse_args(opt_parser)
set.seed(123123 + opt$seed)

# Do simulation
X <- rnorm(1000, mean = 0, sd = 1)
# Find keepers
X.keep <- X[X < -2]
out <- data.frame(seed = opt$seed, X = X.keep)
write.csv(out, file = paste0("./output/", opt$seed, ".csv"), row.names=FALSE, quote=FALSE)

