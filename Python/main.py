#mensaje1 = "Hola Inge"
#mensaje2 = "Hola Neo"
#print(mensaje1 + ", " + mensaje2)


# Importamos el módulo random
import random

# Creamos una lista con los números del 0 al 99
numeros = list(range(100))

# Generamos una lista de 100 números aleatorios sin repetición
aleatorios = random.sample(numeros, 100)

# Creamos una lista vacía para guardar las parejas
parejas = []

# Recorremos la lista de números aleatorios de dos en dos
for i in range(0, 100, 2):
    # Creamos una pareja con los dos números
    pareja = (aleatorios[i], aleatorios[i+1])
    # Añadimos la pareja a la lista de parejas
    parejas.append(pareja)

# Mostramos la matriz de parejas por pantalla
for pareja in parejas:
    print(pareja)