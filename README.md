Do hot streaks exist in sports, using data from Premier League matches from 1993-2023?\
We will investigate if there is significant evidence for hot streaks in sports and also create a predictive model to predict if a team will or won't win the next match
[you can read the paper here](Do_hot_streaks_exist_in_sports.pdf).

If you want to read the actual code used in the research or the data used [click here](Model_Code).

Here is a description of each of the files.

[Pastmatches.csv](Model_Code/Pastmatches.csv) : The database used for our results

[Database query.sql](Model_Code/Database_query.sql) : A SQL query run on BigQuery for the Pastmatches.csv

[Graph.R](Model_Code/Graph.R) : A graph of the distribution of hotstreaks in the over 24000 matches analysed

[Predictive model part 1.R](Model_Code/Predictive_model_part_1.R) : A generalized linear model this was the simpler version just considering the impact of the previous match on the probability the team wins the next match

[Predictive model part 2.R](Model_Code/Predictive_model_part_2.R) : The model would now consider the results of past three matches and the two and three factor interactions

[Document](Document) : This contains the images and tex file to create the paper showing our results and predictive model
