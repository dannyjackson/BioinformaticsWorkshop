#!/bin/sh

# FST script

# all parameters come from the fst_param control file
# make edits there before using this script!
scriptdir=~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop
source ${scriptdir}/fst_params.sh

printf "\n \n \n \n"
date
echo "Current script: fst.sh"

if [ -f "~/IntroBioinformaticsWorkshop/programs/angsd/" ]
        then
                echo "angsd already installed, moving on!"
        else
                echo "Install angsd"
                cd ~/IntroBioinformaticsWorkshop/programs/
                git clone https://github.com/ANGSD/angsd.git 
                cd angsd 
                make 
fi

#this is with 2pops
#first calculate per pop saf for each population (done above)
#calculate the 2dsfs prior
cd ${OUTDIR}/analyses/fst/${WIN}
${OUTDIR}/programs/angsd/misc/realSFS ${OUTDIR}/datafiles/safs/noca_urban.saf.idx ${OUTDIR}/datafiles/safs/noca_rural.saf.idx > ${OUTDIR}/datafiles/mls/noca.pre.post.ml
${OUTDIR}/programs/angsd/misc/realSFS ${OUTDIR}/datafiles/safs/pyrr_urban.saf.idx ${OUTDIR}/datafiles/safs/pyrr_rural.saf.idx> ${OUTDIR}/datafiles/mls/pyrr.pre.post.ml

#prepare the fst for easy window analysis etc
${OUTDIR}/programs/angsd/misc/realSFS fst index ${OUTDIR}/datafiles/safs/noca_urban.saf.idx ${OUTDIR}/datafiles/safs/noca_rural.saf.idx -sfs ${OUTDIR}/datafiles/mls/noca.pre.post.ml -fstout ${OUTDIR}/analyses/fst/noca
${OUTDIR}programs/angsd/misc/realSFS fst index ${OUTDIR}/datafiles/safs/pyrr_urban.saf.idx ${OUTDIR}/datafiles/safs/pyrr_rural.saf.idx -sfs ${OUTDIR}/datafiles/mls/pyrr.pre.post.ml -fstout ${OUTDIR}/analyses/fst/pyrr


#get the global estimate
${OUTDIR}/programs/angsd/misc/realSFS fst stats ${OUTDIR}/analyses/fst/noca.fst.idx > ${OUTDIR}/analyses/fst/noca_global_fst.txt
${OUTDIR}/programs/angsd/misc/realSFS fst stats ${OUTDIR}/analyses/fst/pyrr.fst.idx > ${OUTDIR}/analyses/fst/pyrr_global_fst.txt


# sliding window analyses
# windowed
${OUTDIR}/programs/angsd/misc/realSFS fst stats2 ${OUTDIR}/analyses/fst/pyrr.fst.idx  -win ${WIN} -step ${STEP} > ${OUTDIR}/analyses/fst/${WIN}/slidingwindow_pyrr

# windowed
echo -e 'region\tchr\tmidPos\tNsites\tfst' > ${OUTDIR}/analyses/fst/${WIN}/slidingwindow_fst_pyrr.txt
#tail -n+2 slidingwindow >> slidingwindow_fst.txt 
grep 'NC_' ${OUTDIR}/analyses/fst/${WIN}/slidingwindow_pyrr >> ${OUTDIR}/analyses/fst/${WIN}/slidingwindow_fst_pyrr.txt
sed -i 's/NC_//g' ${OUTDIR}/analyses/fst/${WIN}/slidingwindow_fst_pyrr.txt 
sed -i 's/\.1\t/\t/g' ${OUTDIR}/analyses/fst/${WIN}/slidingwindow_fst_pyrr.txt

Rscript ${OUTDIR}/programs/Intro_Bioinformatics_Workshop/fst_window.r ${OUTDIR} ${WIN}


# should do an "if this doesn't exist, do it" sort of thing here


# single snps
${OUTDIR}/programs/angsd/misc/realSFS fst stats2 ${OUTDIR}/analyses/fst/pyrr.fst.idx -win 1 -step 1 >${OUTDIR}/analyses/fst/singlesnps_pyrr

# single snps
echo -e 'region\tchr\tmidPos\tNsites\tfst' > ${OUTDIR}/analyses/fst/singlesnps_fst_pyrr.txt
#tail -n+2 slidingwindow >> slidingwindow_fst.txt 
grep 'NC_' ${OUTDIR}/analyses/fst/singlesnps_pyrr >> ${OUTDIR}/analyses/fst/singlesnps_fst_pyrr.txt
sed -i 's/NC_//g' ${OUTDIR}/analyses/fst/singlesnps_fst_pyrr.txt 
sed -i 's/\.1\t/\t/g' ${OUTDIR}/analyses/fst/singlesnps_fst_pyrr.txt

Rscript ${OUTDIR}/programs/Intro_Bioinformatics_Workshop/fst_snps.r ${OUTDIR} ${WIN}






# make relevant gene lists



# snps 

awk 'BEGIN {FS = ","} {$1=""}1' ${OUTDIR}/analyses/fst/pyrr.outlierfst.csv | awk 'BEGIN {OFS = ","} {$1=$1}1 ' > ${OUTDIR}/analyses/fst/pyrr.outlierfst.csv.tmp

mv ${OUTDIR}/analyses/fst/pyrr.outlierfst.csv.tmp ${OUTDIR}/analyses/fst/pyrr.outlierfst.csv

sed -i 's/\"//g' ${OUTDIR}/analyses/fst/pyrr.outlierfst.csv

tail -n +2 ${OUTDIR}/analyses/fst/pyrr.outlierfst.csv  > ${OUTDIR}/analyses/fst/pyrr.outlierfst.headless.csv


awk -F',' 'NR>1 {print "NC_0"$1".1" "\t" $2-1 "\t" $2}' ${OUTDIR}/analyses/fst/pyrr.outlierfst.headless.csv > ${OUTDIR}/analyses/fst/pyrr.outlierfst.bed

bedtools intersect -a /xdisk/mcnew/dannyjackson/cardinals_dfinch/datafiles/referencegenome/ncbi_dataset/data/GCF_901933205.1/genomic.gff -b ${OUTDIR}/analyses/fst/pyrr.outlierfst.bed -wa > ${OUTDIR}/analyses/genelist/relevantgenes_snps_top.95.txt

awk '{OFS = "\t"} {split($9, arr, ";"); print(arr[1])}' ${OUTDIR}/analyses/genelist/relevantgenes_snps_top.95.txt | sed 's/ID\=gene\-//g' | sort -u > ${OUTDIR}/analyses/genelist/relevantgenenames_snps_top.95.txt

# windowed

awk 'BEGIN {FS = ","} {$1=""}1' ${OUTDIR}/analyses/fst/${WIN}/pyrr.windowed.outlierfst.csv | awk 'BEGIN {OFS = ","} {$1=$1}1 ' > ${OUTDIR}/analyses/fst/${WIN}/pyrr.windowed.outlierfst.csv.tmp

mv ${OUTDIR}/analyses/fst/${WIN}/pyrr.windowed.outlierfst.csv.tmp ${OUTDIR}/analyses/fst/${WIN}/pyrr.windowed.outlierfst.csv

sed -i 's/\"//g' ${OUTDIR}/analyses/fst/${WIN}/pyrr.windowed.outlierfst.csv

tail -n +2 ${OUTDIR}/analyses/fst/${WIN}/pyrr.windowed.outlierfst.csv > ${OUTDIR}/analyses/fst/${WIN}/pyrr.windowed.outlierfst.headless.csv


awk -F',' -v win="$WIN" 'NR>1 {print "NC_0"$1".1" "\t" $2-(win/2) "\t" $2+(win/2)}' ${OUTDIR}/analyses/fst/${WIN}/pyrr.windowed.outlierfst.headless.csv > ${OUTDIR}/analyses/fst/${WIN}/pyrr.outlierfst.bed

bedtools intersect -a /xdisk/mcnew/dannyjackson/cardinals_dfinch/datafiles/referencegenome/ncbi_dataset/data/GCF_901933205.1/genomic.gff -b ${OUTDIR}/analyses/fst/${WIN}/pyrr.outlierfst.bed -wa > ${OUTDIR}/analyses/genelist/relevantgenes_windowed_top.95.txt

awk '{OFS = "\t"} {split($9, arr, ";"); print(arr[1])}' ${OUTDIR}/analyses/genelist/relevantgenes_windowed_top.95.txt | sed 's/ID\=gene\-//g' | sort -u > ${OUTDIR}/analyses/genelist/relevantgenenames_windowed_top.95.txt
