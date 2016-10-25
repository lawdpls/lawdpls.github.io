Assignment 4 - Replicating a Classic Experiment  
===

#Teammates

- Huayan Sun(jacysun)

- Shijian Li(lawdpls)

#Description

In this experiment, we have four chart types in total. 

#Technical Achievements

###Latin Square Design. 
In our experiment there are four chart types, thus a corresponding latin square would be 4X4 in size. The algorithm to randomly generate this latin square contains 3 stages. 

- Stage 1: Generate the first row. Four elements of this row each contains a unique chart type, that is to say, distribute all chart types in this row.

- Stage 2: Proliferate other rows. Generate other rows to compelete the latin square. There are two ways to get there, namely cyclically right shift elements of first row to obtain a forward diagonal square, or cyclically left shift to obtain a reverse diagonal one.

For a forward diagonal latin square, e.g. 

Cell 1 | Cell 2 | Cell 3 | Cell 4
------ | ------ | ------ | ------
1      | 2      | 3      | 4
4      | 1      | 2      | 3
3      | 4      | 1      | 2
2      | 3      | 4      | 1

Number represents chart types.
Notice first cell of each row is the same as the last cell of last row. If we flatten the square and generate charts accordingly, we'll have adjacent charts every two other charts. It violates the intention of "evenly distribute all charts to reduce variance".

Thus we go for reverse diagonal latin square, e.g.

Cell 1 | Cell 2 | Cell 3 | Cell 4
------ | ------ | ------ | ------
1      | 2      | 3      | 4
2      | 3      | 4      | 1
3      | 4      | 1      | 2
4      | 1      | 2      | 3

- Stage 3: Flatten the square and generate charts accordingly.

- Stage 4: Apply the square to entire experiment. For the 80 trials per participant, simply repeat the procedure 5 times.

#Design Achievements

###d3's ~pesky~ packed layout

- The packed layout of d3 changes the ratio of input data, making radii of all bubbles closer to each other than they actually are. There's no official way to preserve the ratio as far as I'm concerned. Therefore in order to keep the input data in the same range and fashion with other input charts, I manually scaled the auto-generated node data, altering their "r" value.

###No adjacent markers. 

The two random markers are generated in a fashion that they are never adjacent to each other. 
