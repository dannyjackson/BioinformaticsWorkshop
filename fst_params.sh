# FST params

WORKSHOP=~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop # folder with Danny's scripts
PATH=$PATH:$WORKSHOP # this adds the workshop script directory to our path, so that executable scripts in it can be called without using the full path

OUTDIR=~/IntroBioinformaticsWorkshop # main directory for output files

# for fst.sh
WIN=1000 # size of window for fst scans
STEP=1000 # size of step for fst scans

source ${WORKSHOP}/fst_setup.sh