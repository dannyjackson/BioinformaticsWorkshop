args = commandArgs(trailingOnly=TRUE)
OUTDIR = args[1]
WIN = args[2]

library(qqman)
library(readr)
library(ggrepel)
library(ggplot2)
library(dplyr)
library(RColorBrewer)

fst <- read.csv(file.path(OUTDIR, "analyses/fst", WIN, "slidingwindow_singlesnps_fst_pyrr.txt"), sep ='\t')

fst_noNA <- na.omit(fst)
nrow(fst) - nrow(fst_noNA)
fst = fst_noNA
minFST = min(fst$fst)
maxFST = max(fst$fst) # print to file
cat(c("Min FST cutoff:",minFST),file="FST_stats.txt", sep="\n", append=TRUE)
cat(c("Max FST cutoff:",maxFST),file="FST_stats.txt", sep="\n", append=TRUE)

0.988323

# z transform fst values

fst_xbar = mean(fst$fst)
fst_sd = sd(fst$fst)

fst$z <- (fst$fst - fst_xbar)/fst_sd

p_values_one_tailed <- pnorm(q=fst$z, lower.tail=FALSE)

# Calculate -log10(p-value)
fst$neg_log_pvalues_one_tailed <- -log10(p_values_one_tailed)

ordered_fst <- fst %>% 
 # desc orders from largest to smallest
 arrange(desc(neg_log_pvalues_one_tailed)) 

nsnps = nrow(ordered_fst)
onep_snps = round(nsnps*0.001)

outlier_fst_disorder <- ordered_fst[1:onep_snps,]

outlier_fst <- outlier_fst_disorder %>% arrange(chr, midPos)

FSTcutoff = min(outlier_fst_disorder$fst) # print to file

cat(c("FST cutoff:",FSTcutoff),file="FST_stats.txt", sep="\n", append=TRUE)


outlier_fst_disorder2 <- subset(outlier_fst_disorder, select = -c(region))

write.csv(outlier_fst_disorder2, file.path(OUTDIR, "analyses/fst", WIN, "pyrr.outlierfst.csv"))
