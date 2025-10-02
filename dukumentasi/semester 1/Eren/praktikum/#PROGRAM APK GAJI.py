#PROGRAM APK GAJI
print("\n")
print("=========================")
print("== APLIKASI PENGGAJIAN ==")
print ("========================")
print("\n")

nama= str(input("Masukan Nama Pegawai = "))
gapok=int(input("Masukan Gaji Pokok = "))
tunjangan= int(input ("Masukan Tunjangan = "))
makan= int(input ("Masukan Uang Makan = "))
potongan= int(input ("Masukan Uang Potongan = "))
gaber= (gapok + tunjangan + makan) - potongan
print("\n")

print("=========SLIP GAJI==========")
print("\n")
print("Nama karyawan =",nama)
print("Gaji Pokok =",gapok)
print("Tunjangan =,")
print("Uang Makan =",makan)
print("Potongan =",potongan)
print("Gaji Bersih = ",gaber)
print("\n")