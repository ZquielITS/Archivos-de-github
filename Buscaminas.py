import random


def iniciar_buscaminas():
  while True:
    print("==============================================")
    print("               BUSCAMINAS                     ")
    print("==============================================")
    print("1 Facil   (8x8   - 10 minas)")
    print("2 Medio   (16x30 - 50 minas)")
    print("3 Dificil (16x30 - 99 minas)")
    print("______________________________________________")

    try:
      seleccion = int(input("Elige una opcion: "))
      if seleccion == 1:
        filas, columnas, minas = 8, 8, 10
        break
      elif seleccion == 2:
        filas, columnas, minas = 16, 30, 50
        break
      elif seleccion == 3:
        filas, columnas, minas = 16, 30, 99
        break
      else:
        print("Opcion no valida, elige otra.\n")
    except ValueError:
      print("Por favor, introduce un numero entero.\n")

  tablero = [[0 for _ in range(columnas)] for _ in range(filas)]

  minas_colocadas = 0
  while minas_colocadas < minas:
    fila = random.randint(0, filas - 1)
    columna = random.randint(0, columnas - 1)

    if tablero[fila][columna] != -1:
      tablero[fila][columna] = -1
      minas_colocadas += 1

  for i in range(filas):
    for j in range(columnas):
      if tablero[i][j] == 0:
        contador = 0
        for k in range(i - 1, i + 2):
          for l in range(j - 1, j + 2):
            if 0 <= k < filas and 0 <= l < columnas:
              if tablero[k][l] == -1:
                contador += 1
        tablero[i][j] = contador

  print("\n=========== TABLERO GENERADO ===========")
  for i in range(filas):
    fila_texto = ""
    for j in range(columnas):
      val = tablero[i][j]
      if val == -1:
        fila_texto += " -1 "
      elif val < 10:
        fila_texto += f"  {val} "
      else:
        fila_texto += f" {val} "
    print(fila_texto)
  print("=======================================")

if __name__ == "__main__":
  iniciar_buscaminas()