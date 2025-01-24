# FST params

module load R/4.4.0

WORKSHOP=~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop # folder with Danny's scripts
PATH=$PATH:$WORKSHOP # this adds the workshop script directory to our path, so that executable scripts in it can be called without using the full path

OUTDIR=~/IntroBioinformaticsWorkshop # main directory for output files

# make directories for intermediate files-- will fail if these don't exist
mkdir -p ${OUTDIR}/analyses/fst
mkdir -p ${OUTDIR}/analyses/genelist
mkdir -p ${OUTDIR}/datafiles/safs
mkdir -p ${OUTDIR}/datafiles/mls/

# for fst.sh
WIN=10000 # size of window for fst scans
STEP=10000 # size of step for fst scans
mkdir -p ${OUTDIR}/analyses/fst/${WIN}
mkdir -p ${OUTDIR}/analyses/genelist/${WIN}
