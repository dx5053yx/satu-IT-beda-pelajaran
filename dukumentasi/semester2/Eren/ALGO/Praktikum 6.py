import pandas as pd 

df = pd.read_csv ("dataset air.csv")
# df.info()

# status_count = print (df["Status_Mutu_Air"].value_counts())
# air_tercemar = df[df["Status_Mutu_Air"] =="Baik"]
# print(air_tercemar)
# df_sorted = df.sort_values("BOD_mg_L",ascending=)
# print(df_sorted.head())
df["Kategori_Suhu"] = df["Suhu_C"].apply(lambda x: 
"Normal" if x <= 28 else "Tinggi")
print(df.head())
# df.to_csv("hasil_analisis_kualitas_air.csv", index=False)
print(df.describe())