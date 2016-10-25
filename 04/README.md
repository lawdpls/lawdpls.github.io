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

#Design Achievements

- The packed layout of d3 changes the ratio of input data, making radii of all bubbles closer to each other than they actually are. Therefore in order to keep the input data in the same range and fashion with other input charts, I manually altered the node data.
