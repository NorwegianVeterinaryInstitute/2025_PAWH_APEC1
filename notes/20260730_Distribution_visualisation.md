Research article - need of visualisation

Species - APEC

# Organisation, goals 
We have done some analyses, and we have a file containing information 
`results/Results_130226_SSM.xlsx`

We will need to fetch the relevant information and create a table that will allow
us to create the visualisations. So joining tables by common key ensuring this is correct.

My coworker want visualisation of results - if possible one graph (or a collection of graphs) that would allow to evaluate the sampling distribution and composition of the
dataset analyzed. (sampling_distribution_data)

In a first instance, they want proposal of different ways to visualize the same set of data, to be able to choose which one they think is best and easier to read. 
We need to favor ease of reading and clarity. 

# We we need to pay attention to: Data import and quality
- The data is in excel, in several sheets - we have special norwegian characters - that need to be imported correctly
- We need to ensure that the data is read and corrected consisently (tidy - clean data - step 1) - So we need a data quality insurance step
- We might want to translate from norwegian to english - Better - for the table we will use to make the graphs (we do not need to translate data we do not use)

- we have to types of data (I think its in driftsformnavn) - we need to use for separation - or we need to find out 

# Figure expected 

Description of APEC in the Norwegian "poultry" industry 2018-2025
WGS sequenced. 

## We want absolutely: (set of figures for proposal_1)
1. Timeline : distribution PER year visible (to be able to detect eventual bias)
2. How many sendt (insendelser) per year - how many isolates 
3. Different ST and serotype per year (here if difficult we can focus on showing the most commun for the main article eg. at least 10 isolates - possible to have the figure for the less common as appendix for example, or the totallity as appendix - the problem here is to clearly visualize the large amount of different combinaisons). We need to classify each combination of ST-Serotype so its best redeable. 
4. Distinction broiler/parent (must be able to see)
5. Visulisation counts have to be done per isolate count

Possible proposal 
- 1_1: one figure that could represent clearly all this data is optimal BUT it might not be so nice (need to find a good proposal)

Or we create splitted figures
- 1_2: ST - Serotype - number of sending (=insendelse) per year (can eg have number of isolates in brachets) - and broiler/parent (production type) - Important : distribution Per year (so each year can for example be a panel or on an x-axis)
- 1_3:  I would like one figure where the serotypes detected are presented in % - adjusted by the number of isolates per broiler/parent types (as the number are different) to be able to control if there are patterns in proportions


## Eventually we want : (set of figures for proposal_2)
- Eventually add presentation of virulence in this data (not the one that is commun to all isolates) - Excluding : the virulence-associated genes hlyF, iroN, iss, iucC, iutA and ompT because they are present in all APEC variants in the dataset. 


## Notes: 
- An "insendelse" = "a sending", there could be several isolates for 5 animals, and there can be up to 3 isolates per animal
- Visualize per isolate ... so we discard the per animal question - we do not care if same animal or not <!-- I do not think its a good idea but that what they want -->
- Count how many sendings -> add numbers 