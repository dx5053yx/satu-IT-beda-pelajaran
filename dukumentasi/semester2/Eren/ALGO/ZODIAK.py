Tgl = int(input("Masukan tanggal :"))
Bulan = int(input("Masukkan Bulan : "))
if Tgl <= 19 and Bulan == 1 or Tgl >= 22 and Bulan == 12:
    print ("Zodiak Anda Capricorn")
elif Tgl <= 20 and Bulan == 1 or Tgl >= 18 and Bulan == 2:
    print ("Zodiak Anda Aquarius")
elif Tgl <= 19 and Bulan == 2 or Tgl >= 20 and Bulan == 3:
    print ("Zodiak Anda Pisces")
