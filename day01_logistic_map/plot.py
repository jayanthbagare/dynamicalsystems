import pandas as pd 
import matplotlib.pyplot as plt 

df = pd.read_csv("data.csv")

plt.plot(df["n"],df["x"])
plt.title("Logistic Growth")
plt.xlabel("Time Step")
plt.ylabel("X Value")

plt.savefig("plot.png")
