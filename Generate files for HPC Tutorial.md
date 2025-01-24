# Generate files for HPC Tutorial

cp /xdisk/mcnew/dannyjackson/cardinals/referencelists/pyrrruralbams.txt /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrruralbams.txt 
cp /xdisk/mcnew/dannyjackson/cardinals/referencelists/pyrrurbanbams.txt /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrurbanbams.txt

sed -i 's/cardinals/cardinals_dfinch\/datafiles/g' /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrruralbams.txt 
sed -i 's/cardinals/cardinals_dfinch\/datafiles/g' /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrurbanbams.txt 
cd /xdisk/mcnew/dannyjackson/IntroBioinformaticsWorkshop

~/programs/angsd/angsd -bam /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrurbanbams.txt -out pyrr_urban -dosaf 1 -GL 1 -doGlf 2 -doMaf 1 -doMajorMinor 3 -doCounts 1 -doDepth 1 -setMinDepthInd 4 -minInd 2 -minQ 30 -minMapQ 30 -sites /xdisk/mcnew/dannyjackson/cardinals/referencelists/sites_headless.mafs -anc /xdisk/mcnew/finches/dannyjackson/finch_wgs/fastqs/GCF_901933205.fa -nThreads 10 -r NC_044582.1

~/programs/angsd/angsd -bam /xdisk/mcnew/dannyjackson/cardinals_dfinch/referencelists/pyrrruralbams_subset.txt -out pyrr_rural -dosaf 1 -GL 1 -doGlf 2 -doMaf 1 -doMajorMinor 3 -doCounts 1 -doDepth 1 -setMinDepthInd 4 -minInd 2 -minQ 30 -minMapQ 30 -sites /xdisk/mcnew/dannyjackson/cardinals/referencelists/sites_headless.mafs -anc /xdisk/mcnew/finches/dannyjackson/finch_wgs/fastqs/GCF_901933205.fa -nThreads 10 -r NC_044582.1




#this is with 2pops
#first calculate per pop saf for each population (done above)
#calculate the 2dsfs prior
~/programs/angsd/misc/realSFS noca_urban.saf.idx noca_rural.saf.idx > noca.pre.post.ml
~/programs/angsd/misc/realSFS pyrr_urban.saf.idx pyrr_rural.saf.idx> pyrr.pre.post.ml



#prepare the fst for easy window analysis etc
~/programs/angsd/misc/realSFS fst index noca_urban.saf.idx noca_rural.saf.idx -sfs noca.pre.post.ml -fstout noca
~/programs/angsd/misc/realSFS fst index pyrr_urban.saf.idx pyrr_rural.saf.idx -sfs pyrr.pre.post.ml -fstout pyrr




#get the global estimate
~/programs/angsd/misc/realSFS fst stats noca.fst.idx 
FST.Unweight[nObs:2617562]:0.044727 Fst.Weight:0.028677

~/programs/angsd/misc/realSFS fst stats pyrr.fst.idx 
FST.Unweight[nObs:2617605]:0.047155 Fst.Weight:0.030829