terkecil=int(input(f"massukan angka ke-1: "))
i=2
while (i<=10):
    bil=int(input(f"massukan bilanga ke-{i}: "))
    if (terkecil>bil):
        terkecil=bil
    i+=1
print(f"bilangan terkecilnya adalah: {terkecil}")