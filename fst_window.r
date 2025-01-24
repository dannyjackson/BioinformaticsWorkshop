#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
OUTDIR = args[1]
WIN = args[2]

library(qqman)
library(readr)
library(ggrepel)
library(ggplot2)
library(dplyr)
library(RColorBrewer)

fst <- read.csv(file.path(OUTDIR, "analyses/fst", WIN, "slidingwindow_fst_pyrr.txt"), sep ='\t')
fst_noNA <- na.omit(fst)
nrow(fst) - nrow(fst_noNA)
fst = fst_noNA


# z transform fst values

fst_xbar = mean(fst$fst)
fst_sd = sd(fst$fst)

fst$z <- (fst$fst - fst_xbar)/fst_sd

p_values_one_tailed <- pnorm(q=fst$z, lower.tail=FALSE)

# Calculate -log10(p-value)
fst$neg_log_pvalues_one_tailed <- -log10(p_values_one_tailed)



pdf(file = file.path(OUTDIR,"analyses/fst", WIN, "manhattan_windowed_pyrr_logp.pdf"), width = 20, height =7, useDingbats=FALSE)
manhattan(fst, chr="chr", bp="Nsites", snp="midPos", p="neg_log_pvalues_one_tailed", logp=FALSE, ylab = "-log(p-value)", cex = 0.5)
dev.off()

pdf(file = file.path(OUTDIR,"analyses/fst", WIN, "manhattan_windowed_pyrr.pdf"), width = 20, height =7, useDingbats=FALSE)
manhattan(fst, chr="chr", bp="Nsites", snp="midPos", p="fst", logp=FALSE, ylab = "FST", cex = 0.5)
dev.off()