# try:
#     angka = int(input("Masukkan angka: "))
#     hasil = 10 / angka
#     print("Hasil:", hasil)
# except:
#     print("Terjadi kesalahan! Coba lagi.")
try:
    angka = int(input("Masukkan angka: "))
    hasil = 10 / angka
    print("Hasil:", hasil)
except ValueError:
    print("Error: Input harus berupa angka!")
except ZeroDivisionError:
    print("Error: Tidak bisa membagi dengan nol!")
except Exception as e:
    print("Error lain:", e)

# try:
#     angka = int(input("Masukkan angka: "))
#     hasil = 10 / angka
# except ZeroDivisionError:
#     print("Tidak boleh membagi dengan nol!")
# else:
#     print("Hasil pembagian adalah:", hasil)