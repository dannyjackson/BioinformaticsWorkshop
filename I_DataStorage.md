# Data Storage and Backup Strategies

Part 1: Backing Up Our Data

Whether we're working with data we've collected in the field, data we've collated from online sources, or large genomic datasets that we received through a sequencing company, backing up our data immediately and routinely is essential to secure the success of our projects. Inadvertent data degradation or loss can tank a project. We can avert data disasters by following the "3-2-1" rule for data backup. 

For all data generated in our lab, we need to maintain:
   - 3 copies
   - 2 media types
   - 1 offsite copy

For my genomics projects, I store the data in three places: 2 in the cloud (the HPC and the Sequence Read Archive) and 1 local location (an SSD external hard drive). Work through the following question to evaluate the backup status of your own datafiles.

1.	Do your storage solutions meet the 3-2-1 rule? If not, write down which projects require additional backups, where you plan to back them up to, and schedule it in your calendar for some time within the next week. Remember that downloads of big data to external hard drives can take many hours, so prepare to either run it overnight or during an extended period where your computer can sit plugged in and connected to the SSD. If you require an SSD for your project, talk to your PI and make a plan. 

*Note: these [tutorials](https://hpcdocs.hpc.arizona.edu/storage_and_transfers/transfers/overview/) for how to transfer data from the HPC to another storage device may be useful!*

Metadata files are a major component of every dataset, but they are often overlooked until we prepare our datasets for publication. Unpublished data quickly becomes unusable by others if the owner of that data never develops a metadata file, or even by the owner themself if they intend to return to the project in the future. Metadata files should be developed early and stored with our data alongside each backup.

When thinking about how to publish our datasets and write our metadata, we can keep the [FAIR principles](https://www.nature.com/articles/sdata201618) in mind. Our data should be:
   - Findable
   - Accessible
   - Interoperable 
   - Reusable

Metadata makes datasets accessible, interoperable, and reusable. Read through the [example metadata file](https://github/dannyjackson/BioinformaticsWorkshop/ExampleMetadataFile.md) for more information on what data can be included in a metadata file. Then, respond to the following check-in question.

2.	Do you have a metadata file for your dataset? Reflect on the FAIR principles and the example metadata file. Schedule a time in your week to either revise your existing metadata to meet them or write out a metadata file associated with your dataset. Store this in the directory with your dataset and include it with every backup of your data.


Next: [II_HPCTutorial.md](https://github.com/dannyjackson/BioinformaticsWorkshop/blob/main/II_HPCTutorial.md).

![xkcd data trap](https://imgs.xkcd.com/comics/data_trap.png)

*Title text: It's important to make sure your analysis destroys as much data as it produces.*