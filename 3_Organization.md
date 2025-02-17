# III. Data Organization and Documentation

## Goals of this module
1. Recognize the Importance of Clean and Organized Code – Understand how clear coding practices enhance reproducibility, reduce errors, and streamline future reanalysis.

2. Implement Effective File Naming Conventions – Develop structured and meaningful file naming practices to improve data organization and prevent misinterpretation or loss.

3. Evaluate and Improve Current Organizational Practices – Reflect on existing file and directory structures, identify areas for improvement, and implement changes for better data management.

4. Establish a Logical Directory Structure – Create and maintain a standardized directory layout to facilitate efficient project management and collaboration.


Prepare for Version Control and Code Management – Lay the groundwork for maintaining coding repositories by organizing scripts and data in a way that integrates seamlessly with version control tools like Git.

Taking your time and making your code clear, accessible, and organized can often feel like a misuse of time. We're goal-oriented people, and the goal is the product, not the process... what does it matter if my code is clean as long as I find the answer to my research question? We often code in a hyper-focused state with a "get it working" mindset that leaves little space for accurate documentation. 

Relevant xkcd:

![xkcd good code](https://imgs.xkcd.com/comics/good_code.png)

In the Data Storage and Backup Strategies module, we focused on managing our raw data files. However, in large-scale bioinformatics work, we often develop a number of data products in the process of data filtering and analysis. Rather than publishing all of these files, we publish the code that we used to generate them from the raw data. Clear and organized coding practices are essential if we aim to produce accurate and repeatable results. In addition to improving the reproducibility of our science, organized code can also ease our own work burden, as many projects require multiple rounds of reanalysis before they reach publication.

Relevant xkcd:

![xkcd pipeline](https://imgs.xkcd.com/comics/data_pipeline.png)

*Title text: "Is the pipeline literally running from your laptop?" "Don't be silly, my laptop disconnects far too often to host a service we rely on. It's running on my phone."*

File naming conventions form the foundation for clear, effective, and organized code. They are essential for effective data management. Haphazard naming can lead to data misinterpretation or loss, and it's important to keep detailed descriptions of the naming conventions for a project that allows these files to be legible to someone else (in a metadata file, perhaps).

Relevant xkcd:

![xkcd documents](https://imgs.xkcd.com/comics/documents.png)

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

Next, we will learn the basic tools for maintaining coding repositories in [4_CodingSoftware.md](https://github.com/dannyjackson/BioinformaticsWorkshop/blob/main/4_CodingSoftware.md).