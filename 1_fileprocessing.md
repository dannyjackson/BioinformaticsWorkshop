# markdown file for preprocessing

sbatch --account=mcnew \
        --job-name=1_fileprocessing \
        --partition=standard \
        --mail-type=ALL \
        --output=slurm_output/output.1_fileprocessing.%j \
        --nodes=1 \
        --ntasks-per-node=4 \
        --time=7:00:00 \
        --mem=100gb \
        /home/u15/dannyjackson/PopGenWorkshop/BioinformaticsWorkshop/1_fileprocessing.sh