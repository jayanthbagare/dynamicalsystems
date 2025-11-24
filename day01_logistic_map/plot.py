import pandas as pd
import matplotlib.pyplot as plt
import glob
import os


csv_files = glob.glob(os.path.join("./", "*.csv"))

for file_path in csv_files:
    x = file_path.split("_")[2].split(".")[1]
    r = file_path.split("_")[1]
    df = pd.read_csv(file_path)

    plt.plot(df["n"], df["x"])
    plt.title("Logistic Growth_" + r + "_" + x)
    plt.xlabel("Time Step")
    plt.ylabel("X Value")

    plt.savefig("plot" + "_" + r + "_" + x + ".png")
    plt.close()
    del df
