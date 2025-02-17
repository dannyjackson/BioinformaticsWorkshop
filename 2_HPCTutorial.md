# HPC Tutorial

## Goals of this module
1. Understand Basic Command-Line Navigation – Use fundamental terminal commands (e.g., pwd, ls, cd, mkdir) to explore and manage directories efficiently.

2. Gain Access to High-Performance Computing (HPC) Systems – Learn how to connect to the University of Arizona’s HPC using SSH and navigate its file structure.

3. Visualize the HPC Environment – Understand the structure of the HPC system, including login procedures, different computing nodes, and storage locations.

Many smaller analyses can be run on our local computers, and most of us have experience running code locally. As we build more complex models and work with larger datasets, migrating our workflow to remote computing systems is essential. Use of the High Performance Computing systems (or HPC) is necessary for many spatial ecology studies, genomic studies, and simulations. 

**Relevant xkcd:**

![Tamagotchi hive](https://imgs.xkcd.com/comics/tamagotchi_hive.png)

The University of Arizona's HPC offers two access options: the Graphical User Interface (GUI) Open OnDemand, and the command line. While the GUI may feel more intuitive at first, learning to access the HPC through the command line will strengthen your scripting skills and enhance your workflow efficiency.

To access the University of Arizona's HPC using command line, we need use an ssh client. If you have a mac or a Linux computer, you can just open the application "Terminal." If you have a PC, you will need to download an application that can do this. PUTTY is a commonly used one. Hopefully everyone has an ssh client already installed on their computer, but if not, more information on downloading and installing this can be found [here](https://hpcdocs.hpc.arizona.edu/registration_and_access/system_access/#command-line-access).

At its most basic, the terminal has similar functions to Finder (on a Mac) or File Explorer (on a PC). It is a way to navigate the file structure of a computer. There are four basic navigation commands: pwd, ls, cd, and mkdir. We will work through these over the next few steps. First, type "pwd", which stands for "print working directory"
```
pwd
```
The output is the full path to your current directory, with each directory in the path separated by a "/". A directory is the scripting term for a folder in a computer or storage device. Now try out the command "ls"
```
ls
```
This command lists all files in your current directory. You can combine the output of the two to get the absolute path to a file in your current directory. We can use either the absolute or the relative path to refer to a file in command line. For instance, these two example commands both output the files in the subdirectory "subdir" of our current directory:
```
ls subdir/
ls /path/to/current/directory/subdir/
```
I think of looking into the subdirectories of our current location as looking "below" us. We can also look above us using an absolute path, for instance, this command looks at one directory "above" the hypothetical current directory:
```
ls /path/to/current/
```
We can use relative instead of absolute paths to simplify this. Two periods in a row signifies one directory above your current location. Try out the following commands and see what they output:
```
ls ../
ls ../../
ls ../../../
```
Understanding file structures will be very useful in developing scripts in the future.

Now let's log into the HPC using the command "ssh." This stands for "secure shell" and is a way to log into the HPC from your local computer. You must be either on the university's wifi or using a secure [Virtual Private Network (VPN)](https://it.arizona.edu/remote-work) to access the university's wifi remotely. Use the following command followed by your password to log in. Note the use of angle brackets: <>, which commonly indicate a placeholder value. These indicate that the text within them should be edited by the user. In this case, replace it with your UA Net ID. For example, mine is dannyjackson@hpc.arizona.edu.
```
ssh <YourNetID>@hpc.arizona.edu
```
*Note: to avoid needing to use your password and two-factor-authentication in the future, look into the use of [ssh keys](https://hpcdocs.hpc.arizona.edu/registration_and_access/system_access/#ssh-keys).*

We are in what is called the "Bastion Host". This is a computer that validates your credentials and provides a gateway to the rest of the HPC environment. You do not need to think any more about this -- just know that part of your login process involves using the command "shell" to move past this checkpoint.
```
shell
```
Here is a diagram to help visualize how we are navigating the structure of the HPC. All commands used to navigate between locations are in blue, compute nodes are in red, and storage allocations are in green. Refer back to it throughout the process and at the end of today's workshop to check in on your understanding of the HPC.
![diagram of HPC structure](https://github.com/dannyjackson/BioinformaticsWorkshop/blob/main/images/HPC_Structure.png)


Let's take a look around the HPC using the two commands we've learned on our local computer. Notice where we are located in the structure of the HPC and if we have any files in our home directory:
```
pwd
ls
```
Now that we have a sense of how to navigate the HPC, we can evaluate our current data organization methods in [3_Organization.md](https://github.com/dannyjackson/BioinformaticsWorkshop/blob/main/3_Organization.md)).