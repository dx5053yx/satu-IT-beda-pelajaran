import matplotlib .pyplot as plt
import pandas as pd 

df = pd.read_csv ("dataset air.csv")
status_count = df["Status_Mutu_Air"].value_counts()

# -Grafik Batang Status Mutu Air-
# plt.figure()
# plt.bar(status_count.index, status_count.values)
# plt.title("Jumlah Status Mutu Air")
# plt.xlabel("Status Mutu Air")
# plt.ylabel("Jumlah Sampel")
# plt.show()

# -Grafik Garis BOD per Lokasi-
# plt.figure()
# plt.plot(df["Lokasi"], df["BOD_mg_L"])
# plt.xticks(rotation=90)
# plt.title("Nilai BOD per Lokasi")
# plt.xlabel("Lokasi")
# plt.ylabel("BOD (mg/L)")
# plt.tight_layout()
# plt.show()

# -Scatter Plot BOD vs COD-
# plt.figure()
# plt.scatter(df["BOD_mg_L"], df["COD_mg_L"])
# plt.title("Hubungan BOD dan COD")
# plt.xlabel("BOD (mg/L)")
# plt.ylabel("COD (mg/L)")
# plt.show()

# -Histogram Nilai pH-
# plt.figure()
# plt.hist(df["pH"], bins=10)
# plt.title("Distribusi Nilai pH Air")
# plt.xlabel("pH")
# plt.ylabel("Frekuensi")
# plt.show()

# -Rata-rata BOD per Status Mutu Air-
group = df.groupby("Status_Mutu_Air")["BOD_mg_L"].mean()
plt.figure()
plt.bar(group.index, group.values)
plt.title("Rata-rata BOD per Status Mutu Air")
plt.xlabel("Status Mutu Air")
plt.ylabel("BOD Rata-rata (mg/L)")
plt.show()