# III. Data Organization and Documentation

Taking your time and making your code clear, accessible, and organized can often feel like a misuse of time. We're goal-oriented people, and the goal is the product, not the process... what does it matter if my code is clean as long as I find the answer to my research question? We often code in a hyper-focused state with a "get it working" mindset that leaves little space for accurate documentation. 

Relevant xkcd:

![xkcd good code](https://imgs.xkcd.com/comics/good_code.png)

File naming conventions form the foundation for clear, effective, and organized code. They are essential for effective data management. Haphazard naming can lead to data misinterpretation or loss, and it's important to keep detailed descriptions of the naming conventions for a project that allows these files to be legible to someone else (in a metadata file, perhaps).

Relevant xkcd:

![xkcd documents](https://imgs.xkcd.com/comics/documents_2x.png)

File Naming:
1.	Have you implemented a file naming convention for the raw files of project? If so, write it out in generalized terms (e.g. projectID_sampleID.fa.gz). Is it sufficient for future researchers to understand or do you need to make a change? If not, write out a generalized naming convention that you plan to use.
2.  Do you use file naming conventions for your downstream files? Look through some of the files that you've generated in the course of one of your projects. Are the file names meaningful? Can you readily reproduce these files from the raw files with your existing code? Can someone else?


**Directory Structure:**
In addition to file naming, keeping an organized system of directories for each project is also essential for data management. I create a new directory for each project that contains the following directories:
   - analyses
   - datafiles
   - referencelists
   - scripts  

I create new subdirectories within "analyses" to hold data products from that specific analysis. I store raw and modified datafiles in the directory "datafiles." I use "referencelists" as a place to store lists that are relevant across multiple analyses, for instance a list of chromosome names in a genome, or a list of sample names and their locations. Finally, I may use "scripts" to store in-progress scripts for an analysis that I'm working on that I have not fully integrated into my GitHub. Other folks may clone their GitHub repositories directly into the "scripts" subdirectory for each project, but I prefer to keep all of my code across projects in the same directory (~/programs/).

Let's reflect on our directory structure for our project of interest. I recommend performing the next activity on the HPC if you have an ongoing project, but you can also focus on a local project. Either way, please use the terminal to navigate your files!

3.	Open a new terminal window and access the HPC. Following the format of the example below, write out the structure of your project's directories. You do not need to write out the files, just the directories. Title this "<DATE> <Project Name> Directory Structure"

![diagram of directory structure](https://github.com/dannyjackson/BioinformaticsWorkshop/blob/main/images/Directory_Structure.png)


4.	Now make a new page. On a new page in your document, write out a more organized directory structure using the same format, titled "<Ideal> <Project Name> Directory Structure". Again, you do not need to write out the files, just the directories. If your directory structure is perfect, you can skip this step, but I imagine we all discovered some areas where we could improve. 

Next, we will learn the basic tools for maintaining coding repositories in [4_CodingSoftware.md](https://github.com/dannyjackson/BioinformaticsWorkshop/blob/main/4_CodingSoftware
.md)).