import random
import time

lista = ["piedra", "papel", "tijera"]

while True:
	usuario = input("Elije: piedra, papel, tijera: ")
	if usuario not in lista:
		print("Esta opción no existe o no es valida")
		continue

	pc = random.choice(lista)
	print(f"La computadora ha elegido {pc}")
	time.sleep(2)

	if usuario == pc:
		time.sleep(1)
		print(f"Empate!, ambos eligieron {pc}")
	
	elif usuario == "piedra" and pc == "tijera":
		time.sleep(1)
		print(f"Has ganado! {usuario} vence a {pc}")

	elif usuario == "tijera" and pc == "papel":
		time.sleep(1)
		print(f"Has ganado! {usuario} vence a {pc}")

	else:
		print(f"Ha ganado la computadora con {pc}, gracias por jugar")
		time.sleep(1)