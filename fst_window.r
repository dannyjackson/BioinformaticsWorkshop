#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
OUTDIR = args[1]
WIN = args[2]

OUTDIR="~/IntroBioinformaticsWorkshop" # main directory for output files
WIN = 50000

library(qqman)
library(readr)
library(ggrepel)
library(ggplot2)
library(dplyr)
library(RColorBrewer)

fst <- read.csv(file.path(OUTDIR, "analyses/fst", WIN, "slidingwindow_fst_pyrr.txt"), sep ='\t')
fst_noNA <- na.omit(fst)
nrow(fst) - nrow(fst_noNA) # print
fst = fst_noNA


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

cat(c("FST cutoff windowed:",FSTcutoff),file="FST_stats.txt", sep="\n", append=TRUE)


outlier_fst_disorder2 <- subset(outlier_fst_disorder, select = -c(region))

write.csv(outlier_fst_disorder2, file.path(OUTDIR, "analyses/fst", WIN, "pyrr.windowed.outlierfst.csv"))




pdf(file = file.path(OUTDIR,"analyses/fst", WIN, "manhattan_windowed_pyrr_logp.pdf"), width = 20, height =7, useDingbats=FALSE)
manhattan(fst, chr="chr", bp="Nsites", snp="midPos", p="neg_log_pvalues_one_tailed", logp=FALSE, ylab = "-log(p-value)", cex = 0.5)
dev.off()

# draw it with cutoff line 

blues <- "#082B64"

middlechr = (max(fst$midPos) + WIN/2)/2

png(file = file.path(OUTDIR,"analyses/fst", WIN, "pyrr.fst.windowed.sigline.png"), width = 2000, height =500)

ggplot(fst, aes(x=midPos, y=(fst))) +
  # Show all points
  geom_point(aes(color=as.factor(chr)), alpha=0.8, size=.5) +
  scale_color_manual(values = blues) +

  # custom X axis:
  scale_x_continuous( label = middlechr, breaks= middlechr, guide = guide_axis(n.dodge = 2) ) +
  scale_y_continuous(expand = c(0, 0), limits = c(0,1)) + # expand=c(0,0)removes space between plot area and x axis 
  
  # add plot and axis titles
  ggtitle(NULL) +
  labs(x = "Chromosome", y = "fst") +
  
  # add genome-wide sig and sugg lines
  geom_hline(yintercept = FSTcutoff) +
  
  # Add highlighted points
  #geom_point(data=subset(df.tmp, is_highlight=="yes"), color="orange", size=2) +
  
  # Add label using ggrepel to avoid overlapping
  geom_label_repel(data=fst[fst$is_annotate=="yes",], aes(label=as.factor(midPos), alpha=0.7), size=5, force=1.3) +
  
  # Custom the theme:
  theme_bw(base_size = 22) +
  theme( 
    plot.title = element_text(hjust = 0.5),
    legend.position="none",
    panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )


dev.off()



pdf(file = file.path(OUTDIR,"analyses/fst", WIN, "manhattan_windowed_pyrr.pdf"), width = 20, height =7, useDingbats=FALSE)
manhattan(fst, chr="chr", bp="Nsites", snp="midPos", p="fst", logp=FALSE, ylab = "FST", cex = 0.5)
dev.off()