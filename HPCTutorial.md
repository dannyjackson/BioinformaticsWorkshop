# HPC Tutorial

We will need to use an ssh client to log into the University of Arizona's High Performance Computing (HPC) using command line. If you have a mac or a Linux computer, you can just open the application "Terminal." If you have a PC, you will need to download an application that can do this. PUTTY is a commonly used one. More information on downloading and installing this can be found [here](https://hpcdocs.hpc.arizona.edu/registration_and_access/system_access/#command-line-access).

At its most basic, the terminal has similar functions to Finder (on a Mac) or File Explorer (on a PC). It is a way to navigate the file structure of a computer. There are four basic navigation commands: pwd, ls, cd, and mkdir. We will work through these over the next few steps. First, type "pwd", which stands for "print working directory"
```
pwd
```
The output is the full path to your current directory, with each directory in the path separated by a "/". A directory is the scripting term for a folder in a computer or storage device. Now try out the command "ls"
```
ls
```
This command lists all files in your current directory. You can combine the output of the two to get the full path to a file in your current directory. This will be very useful in developing scripts in the future.

Now let's log into the HPC using the command "ssh." This stands for "secure shell" and is a way to log into the HPC from your local computer. You must be either on the university's wifi or using a secure Virtual Private Network (VPN) to access the university's wifi remotely.
```
ssh <YourNetID>@hpc.arizona.edu
```
We are in what is called the "Bastion Host". This is a computer that validates your credentials and provides a gateway to the rest of the HPC environment. You do not need to think any more about this -- just know that part of your login process involves using the command "shell" to move past this checkpoint.
```
shell
```
Here is a diagram to help visualize how we are navigating the structure of the HPC. All commands used to navigate between locations are in blue, compute nodes are in red, and storage allocations are in green. Refer back to it throughout the process and at the end of today's workshop to check in on your understanding of the HPC.
![diagram of HPC structure](https://github.com/dannyjackson/Intro_Bioinformatics_Workshop/blob/main/HPC_Structure.png)

Let's take a look around the HPC using the two commands we've learned on our local computer. Notice where we are located in the structure of the HPC and if we have any files in our home directory:
```
pwd
ls
```
Let's make another directory that will house all of the files and scripts for this workshop. We'll use the command "mkdir" with the flag -p and the argument "IntroBioinformaticsWorkshop". A flag follows a command and always starts with a "-", and changes the behavior of the command if it is present or not. In this case, the -p flag tells the mkdir command to only make the directory "IntroBioinformaticsWorkshop" if it does not already exist. Run the following lines of code in your terminal:
```
mkdir -p IntroBioinformaticsWorkshop
ls
cd IntroBioinformaticsWorkshop
ls
```
Following that series of commands shows how we can navigate the file structure in the HPC without needing a "GUI" (a graphical user interface). We've replicated the experience of moving through a file structure in Finder or File Explorer. By learning to perform these actions using the command line now, we will ultimately be empowered to develop much more complex scripts.

Now, let's create a group of 5 directories that I consider a standard set for any bioinformatic project. Within one of those directories, we will also create a subdirectory called "fst" that will house the output of today's example data analysis.
```
mkdir -p analyses datafiles scripts referencelists programs
mkdir -p ~/IntroBioinformaticsWorkshop/analyses/fst
```
Take a moment to think through why I might value this structure, and if it applies to your current project. Would it improve your organization to use this structure? If not, is there another strcuture that might be helpful?

Now let's work through the process of running a script. We won't be writing our own, but we will instead be using examples that I've created for this workshop. These examples provide an excellent skeleton for your future scripting, but today we are focused on running them and exploring the output, not on writing full scripts of our own.

To access these scripts, move into the "programs" directory and copy the script and datafiles from my github using the commands below:
```
cd programs
git clone https://github.com/dannyjackson/Intro_Bioinformatics_Workshop
```
Let's explore these scripts and datafiles to see what we've copied over. First, see what new files exist in our directory:
```
ls
```
Now, move into the new directory and see what exists there
```
cd Intro_Bioinformatics_Workshop
ls
```
Since we see that there are datafiles in this example script, let's copy them over to our working directory for today's workshop. The main directory that we're working in today is ~/IntroBioinformaticsWorkshop/ and remember that we made a subdirectory called datafiles. Let's move into that directory, make a subdirectory titled "safs" and move into it, and then copy over all of the datafiles from within the new github directory.
```
cd ~/IntroBioinformaticsWorkshop/datafiles/
mkdir safs
cd safs
cp ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/datafiles/* .
```
The command cp copies the first argument into the second argument. If the second argument is a filename, it will rename the datafile and move it into the new location. If it is a directory, it will keep the original filename but copy it to the new location. 
Notice that in the first argument, I've written out a full path to a directory followed by an asterisk. An asterisk in bash is a wildcard that matches to all characters of any length, so it will capture all files and directories in the prescribed location. 
I used a shorthand as my second file location "." which means "current directory". I could have instead written out this command, which would have done the same thing: cp ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/datafiles/* ~/IntroBioinformaticsWorkshop/datafiles/safs/
In plain english, the "cp" command copies all files from the folder ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/datafiles/ to our current folder, which is ~/IntroBioinformaticsWorkshop/datafiles/safs/. This allows us to keep all data from various sources organized in the same directory (~/IntroBioinformaticsWorkshop/datafiles/), whether we download it from my github, from eBird, from NCBI, or various other sources.

Okay, now let's work on running a script! We are currently just within a login node, which is not allocated enough computing space to properly complex analyses. We can move files around and look at them, but not much more. 
We have to options for how to access a computing node. One option is an "interactive" session, which is what we will be using today. This allows us to type directly into the terminal and run code interactively. The other option is with a slurm script. These can handle much more complex tasks that take more time and memory to complete. My preferred workflow when working with genomic data involves subsetting the data into a very small piece that can run interactively so that I can troubleshoot my code with shorter wait times on analyses, then run the perfected script on the full dataset.

To access an interactive session, we first want to consider which cluster we want to access. The UA HPC has three clusers: elgato, ocelot, and puma9. Of these, elgato and ocelot have more availability for interactive sessions. Let's start with elgato
```
elgato
```
We can then start an interactive session using the following command:
```
interactive
```
If you are doing a lot of computational work on the HPC, you should be assigned to your lab group. Once assigned, you can start an interactive session with one of the following, depending on your lab group:
interactive -a mcnew
interactive -a laurenpetrullo
the -a option is followed by the account holder's NetID (your PI). Options are different than flags: while both use the syntax of a '-" followed by a letter, an option is followed by an argument while a flag is not. Flags change the behavior of the command by either being present or absent, while options change the behavior with a specific argument.

Now, let's practice by running a script. First, navigate to the directory where this analysis will print its output files:
```
cd ~/IntroBioinformaticsWorkshop/analyses/fst
ls
```
Notice that no files yet exist in this directory. We are going to run the script that is found here:
~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
You can explore that script either by viewing it on my github page or with the command:
```
less ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
```
To exit a "less" window, type "q"
But today (and only today) we aren't responsible for comprehending the entire script that we are going to run. We just want to run it and see what happens. To make it run, we have to change the permissions of the file to make it "executable". We'll do that with the chmod command. chmod has the ability to add or take away your ability to read and edit your files, so be very careful when running it to understand exactly what it will be doing. 
Here, we have one flag "+x" which tells chmod to add executable rights to the file and one argument which is the full path to the script that we want to run. We can take away executable rights with the flag -x as long as we still have writable rights (which are edited with the flags -w and +w, although I highly recommend against playing around with those)
```
chmod +x ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
```
Now that our file is executable, it works just like a command. We can run it by typing out the full path to our new "command" as follows. Once it begins to run, it will start to output a lot of data to the terminal:
```
~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
```



for troubleshooting
```
chmod -x ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
cd ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/
git pull 

cd ~/IntroBioinformaticsWorkshop/analyses/fst


chmod +x ~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
~/IntroBioinformaticsWorkshop/programs/Intro_Bioinformatics_Workshop/fst.sh
```
