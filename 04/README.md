Assignment 4 - Replicating a Classic Experiment  
===

Project link: ["Experiment"](http://lawdpls.github.io/04/index.html).

#Teammates

- Huayan Sun(jacysun)

- Shijian Li(lawdpls)

- 

#Experiment Description

This experiment follows the design philosophy of Cleveland and McGill's experiment in 1984. Here we have four chart types in total. They are bar chart, pie chart, bubble chart and radial bar chart, representing aligned length, angle, area and aligned length on radial axis respectively. 

The hypothesis we have for the experiment is two-fold.

 1. Aligned length has the best performance, followed by 		  angle then area.
 2. Radial axis leads to misunderstanding, and aligned length on radial axis will have much worse performance than aligned length on rectilinear axis.

We gathered totally 10 people to conduct the experiment, for each of the participants 20 charts per type are shown, amounts to a total number of 80 charts. In each chart 10 random values will be generated, with two randomly marked. The two marked values are never adjacent to each other, and the chart is uncolored.

- We have some ideas on testing adjacency and/or color, see Design Achievement section for more information.

Each participant are told to compare the value of marked value following the instruction. We decide to not explicitly tell participants what channel to look at, otherwise the misleading features of radial axis will be lost.

All the values are initially generated between 0~100. After some thinking, we decide to give the values a baseline of 20. The reason for this is that 2 extremely small values will distort the effectiveness of the channel, making it less accurate than normal.

The 80 charts are generated in random order following the latin square design to keep participants' performance steady and stable.

- See Technical Achievements section for details on the latin square design.

After the experiment is completed, a CSV file will be generated locally, and we collect all files from the participants, merge them into one master CSV file, and start the analysis.

Cover page of the experiment, note the options to test adjacency and/or color:
![main](img/main.png)
Example of a bar chart:
![bar](img/bar.png)
Example of a pie chart:
![pie](img/pie.png)
Example of a bubble chart:
![bub](img/bub.png)
Example of a radial bar chart:
![radial](img/radial.png)

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
Notice first cell of each row is the same as the last cell of last row. If we flatten the square and generate charts accordingly, we'll have adjacent charts every two other charts. It violates the intention of "evenly distribute all charts to reduce performance deviation".

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

###Progress tracker

This is just to give the participants some general sense of how far they've gone, because most people tend to rage quit without it after 30~40 charts.

###Switchable adjacent markers 

- We have implemented a switch to toggle on/off the policy of no adjacent markers. Checking the "Adjacent" box in the first page will make all charts to only generate adjacent markers. Therefore we can test out adjacency versus no adjacency on the same type of chart.

###Switchable fill color 

- Similiarly, we have also implemented a switch to toggle on/off the policy of no color. Checking the "Color" box in the first page will make all charts to fill the marked values with two random colors. Thus we can test out what colors can do to human's perception of the two values.

###Very unfortunately, no one was willing to conduct a survey containing 80 pages 4 or 3 or even 2 times. We decided to put in these features but follow only the vanilla experiment, for now.

###d3's ~~pesky~~ packed layout

-The packed layout will sometimes change the order of the random values to "pack" the bubbles, making my adjacent only design look like a joke. Duh.
