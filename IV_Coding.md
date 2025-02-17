# IV. Code Management with Github and VSCode 

While the process of coding can be messy, the end result needs to be legible and clear. I prefer to automate my scripts so that they can be used across projects by modifying a few parameters rather than manually revising the entire script. In this module, we will get a brief introduction to code management using GitHub and VSCode, and will explore a few example scripts that can serve as templates for your future code.

![xkcd automation](https://imgs.xkcd.com/comics/automation_2x.png)

Return to the terminal window that we used in II_HPCTutorial to log into the UA HPC. Let's begin by making a directory that will house all of the files and scripts for this workshop. We'll use the command "mkdir" with the flag -p and the argument "BioinformaticsWorkshop". A flag follows a command and always starts with a "-", and changes the behavior of the command if it is present or not. In this case, the -p flag tells the mkdir command to only make the directory "BioinformaticsWorkshop" if it does not already exist. Run the following lines of code in your terminal one at a time and observe the changes that result:
```
ls
mkdir -p BioinformaticsWorkshop
ls
cd BioinformaticsWorkshop
ls
cd ..
ls
pwd
cd BioinformaticsWorkshop
```
Following that series of commands shows how we can navigate the file structure in the HPC without needing a "GUI" (a graphical user interface). We've replicated the experience of moving through a file structure in Finder or File Explorer. By learning to perform these actions using the command line now, we will ultimately be empowered to develop much more complex scripts.

Now, let's create a group of 5 directories that I consider a standard set for any bioinformatic project. 
```
mkdir -p analyses datafiles scripts referencelists programs
```
Take a moment to think through why I might value this structure, and if it applies to your current project. Would it improve your organization to use this structure? If not, is there another strcuture that might be helpful?

Now let's work through the process of running a script. We won't be writing or running them in this module, but we will be reading examples that I've created for this workshop. These examples provide an excellent skeleton for your future scripting, and today we are just focused on understanding the general structure of scripting.

To access these scripts, move into the "programs" directory and copy the script and datafiles from my github using the commands below:
```
cd programs
git clone https://github.com/dannyjackson/BioinformaticsWorkshop/example_scripts
```
Let's explore these scripts and datafiles to see what we've copied over. First, see what new files exist in our directory: