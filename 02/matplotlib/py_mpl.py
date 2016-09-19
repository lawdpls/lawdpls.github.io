import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("../cars-sample.csv", sep=",")
weight = data["Weight"]
MPG = data["MPG"]

color=[]
for index, row in data.iterrows():
	if row["Manufacturer"] == "bmw":
		color.append('r')
	elif row["Manufacturer"] == "ford":
		color.append('g')
	elif row["Manufacturer"] == "honda":
		color.append('b')
	elif row["Manufacturer"] == "mercedes":
		color.append('c')
	elif row["Manufacturer"] == "toyota":
		color.append('y')
print data

plt.scatter(data["Weight"], data["MPG"],
            s=data["Weight"]/20, alpha = 0.5,
            c=color, lw=0, label=data["Manufacturer"])
plt.title("Cars Sample")
plt.xlabel("Weight")
plt.ylabel("MPG")

axis = plt.gca()
axis.set_xlim([1200,5000])
axis.set_ylim([8,48])
axis.set_axisbelow(True)
axis.yaxis.grid(color='lightgray', linestyle='-')
axis.xaxis.grid(color='lightgray', linestyle='-')
axis.patch.set_facecolor('white')

plt.show()