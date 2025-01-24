# HPC Tutorial

ssh dannyjackson@hpc.arizona.edu

shell
pwd
mkdir -p IntroBioinformaticsWorkshop
cd IntroBioinformaticsWorkshop
ls
mkdir -p analyses datafiles scripts referencelists programs
cd programs
git clone https://github.com/dannyjackson/Intro_Bioinformatics_Workshop

cd Intro_Bioinformatics_Workshop

ls

chmod +x fst.sh

cd ~/IntroBioinformaticsWorkshop/datafiles/safs
cp ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/datafiles/* .

elgato
interactive -a mcnew
OR 
interactive -a laurenpetrullo
OR 
interactive
cd ~/IntroBioinformaticsWorkshop/analyses/fst
ls

chmod +x ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh

chmod -x ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
git pull ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh