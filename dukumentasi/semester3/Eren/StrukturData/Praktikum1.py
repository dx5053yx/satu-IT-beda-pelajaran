# Integer
x = 1
y = 5
# Hasil
z = x + y 
print (z)

# Float
x = 0.5
y = 0.8
# Hasil
z = x * y
print (z)

# String
x = "Sepeda"
y = " Motor"
# Hasil
z = x + y
print (z)

# Pengulangan String
x = "Sepeda"
# Hasil
a = x * 2
print (a)

# Slice
x = "Sepeda"
# Ambil String di depan
b = x[:2]
# Ambi String Setelah 2
c = x [2:]
# Ambil Sesuai Posisi 
# String diambil dari indeks 0
d = x[0] + x[5]
# Hasil
print (b)
print (c)
print (d)

# String Algo
f = "4"
g = "5"
# Hasil
h = f + g
print (h)

# Kapitalisasi String
i = "eren" 
j = str.capitalize(i)
# Hasil
print ("Nama Kamu =", j)

# Panjang String
r = "SukaMakan"
s = "hobi"
# Hasil
print (len(r))
print (len(s))

# Cek Nilai Digit
digit = 404
nondigit = "Empat Kosong Empat"

print (digit.is_integer())
print (nondigit.isdigit())

# Mengganti String
Nama = "Joko Widarma"
ganti = Nama.replace ("Joko", "Aldi")
print(ganti)

Menu = "Nasi Padang"
caristring = "Rendang"
print(Menu.find(caristring))

# Boolean

# Case 01
harga = 10000

# Hasil
if harga >= 1000 :
    print ("Diskon 10%")
else :
    print ("Tidak Dapat Diskon")

# Case 02
Islogin = False

if Islogin ==  True :
    print ("Welcome")
else :
    print ("Silahkan Login")