import pandas as pd 

df = pd.read_csv ("Praktikum 5.csv")
print(df)

# Menampilkan data
print("Data nilai mahasiswa:")
print(df)
# Menghitung nilai rata-rata
rata_rata = df["Nilai"].mean()
print("Nilai rata-rata:", rata_rata)
# Menampilkan mahasiswa dengan nilai tertinggi
tertinggi = df.loc[df["Nilai"].idxmax()]
print("Mahasiswa dengan nilai tertinggi:")
print(tertinggi)
# Menampilkan Status
df["Status"] = df["Nilai"].apply(lambda x: "Lulus" if x >= 90 else "Tidak Lulus")
print(df)