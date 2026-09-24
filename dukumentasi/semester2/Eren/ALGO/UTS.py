Nama = "Eirenetrian"
Umur = 1800 
Jurusan = "Teknik_Informatika"
print (Nama)
print (Umur, "Tahun")
print (Jurusan)

Nilai = int(input("Masukkan Nilai = "))
if Nilai >= 75 :
    print ('Anda Lulus')
elif Nilai < 75 :
    print ("Anda Tidak Lulus")
else :
    print ("Tidak Valid")

Angka = int(input("Masukkan Angka = "))
if Angka % 2 == 0 :
    print ("Angka Genap")
elif Angka % 2 == 1 :
    print ("Angka Ganjil")
else :
    print ("Tidak Valid")