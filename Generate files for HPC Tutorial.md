# Generate files for HPC Tutorial

cp /xdisk/mcnew/dannyjackson/cardinals/referencelists/pyrrruralbams.txt /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrruralbams.txt 
cp /xdisk/mcnew/dannyjackson/cardinals/referencelists/pyrrurbanbams.txt /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrurbanbams.txt

sed -i 's/cardinals/cardinals_dfinch\/datafiles/g' /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrruralbams.txt 
sed -i 's/cardinals/cardinals_dfinch\/datafiles/g' /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrurbanbams.txt 
cd /xdisk/mcnew/dannyjackson/IntroBioinformaticsWorkshop

~/programs/angsd/angsd -bam /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrurbanbams.txt -out pyrr_urban -dosaf 1 -GL 1 -doGlf 2 -doMaf 1 -doMajorMinor 3 -doCounts 1 -doDepth 1 -setMinDepthInd 4 -minInd 2 -minQ 30 -minMapQ 30 -sites /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/sites_headless.mafs -anc /xdisk/mcnew/finches/dannyjackson/finch_wgs/fastqs/GCF_901933205.fa -nThreads 10 -r NC_044582.1

~/programs/angsd/angsd -bam /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrruralbams_subset.txt -out pyrr_rural -dosaf 1 -GL 1 -doGlf 2 -doMaf 1 -doMajorMinor 3 -doCounts 1 -doDepth 1 -setMinDepthInd 4 -minInd 2 -minQ 30 -minMapQ 30 -sites /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/sites_headless.mafs -anc /xdisk/mcnew/finches/dannyjackson/finch_wgs/fastqs/GCF_901933205.fa -nThreads 10 -r NC_044582.1
