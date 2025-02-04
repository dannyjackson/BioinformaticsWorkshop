# fst setup
module load R/4.4.0
module load htslib/1.19.1
module load bedtools2/2.29.2

# make directories for intermediate files-- will fail if these don't exist
mkdir -p ${OUTDIR}/analyses/fst
mkdir -p ${OUTDIR}/analyses/genelist
mkdir -p ${OUTDIR}/datafiles/safs
mkdir -p ${OUTDIR}/datafiles/mls/
mkdir -p ${OUTDIR}/analyses/fst/${WIN}
mkdir -p ${OUTDIR}/analyses/genelist/${WIN}