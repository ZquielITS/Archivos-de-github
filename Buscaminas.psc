Algoritmo Buscaminas
	Definir filas, columnas, minas, tablero, seleccion Como Entero;
	
	Definir fila, columna Como Entero;
	Definir minasColocadas, contador Como Entero;
	
	filas = 8;
	columnas = 8;
	Dimension tablero[8, 8]
	
	Repetir
		Escribir "==============================================";
		Escribir "              BUSCAMINAS                      ";
		Escribir "==============================================";
		Escribir "1 Facil   (8x8   - 10 minas)";
		Escribir "2 Medio   (16x30 - 50 minas)";
		Escribir "3 Dificil (16x30 - 99 minas)";
		Escribir "______________________________________________";
		Escribir Sin Saltar "Elige una opcion"
		Leer seleccion;
		
		Segun seleccion Hacer
			1:
				filas = 8;
				columnas = 8;
				minas = 10;
			2:
				filas = 16;
				columnas = 30;
				minas = 50;
			3:
				filas = 16;
				columnas = 30;
				minas = 99;
			De Otro Modo:
				Escribir "Opcion no validad, elige otra.";
		FinSegun
		
	Hasta Que seleccion >= 1 Y seleccion <= 3
	
	Redimensionar tablero[filas, columnas]
	
	Para i = 1 Hasta filas Hacer
		Para j = 1 Hasta columnas Hacer
			tablero[i, j] = 0;
		FinPara
	FinPara
	
	Mientras minasColocadas < minas Hacer
		fila = Aleatorio(1, filas);
		columna = Aleatorio(1, columnas);
		
		Si tablero[fila, columna] != -1 Entonces
			tablero[fila, columna] = -1;
			minasColocadas = minasColocadas + 1;
		FinSi
	FinMientras
	
	Para i = 1 Hasta filas Hacer
		Para j = 1 Hasta columnas Hacer
			
			Si tablero[i, j] = 0 Entonces
				contador = 0;
				Para k = i - 1 Hasta i + 1 Hacer
					Para l = j - 1 Hasta j + 1 Hacer
						
						Si k >= 1 Y k <= filas Y l >= 1 Y l <= columnas Entonces
							Si tablero[k, l] = -1 Entonces
								contador = contador + 1;
							FinSi
						FinSi
					FinPara
				FinPara
				
				tablero[i, j] = contador;
			FinSi
		FinPara
	FinPara
	
	Escribir "";
	Escribir "=========== TABLERO GENERADO ===========";
	
	Para i = 1 Hasta filas Hacer
		Para j = 1 Hasta columnas Hacer
			
			Si tablero[i,j] = -1 Entonces
				Escribir  Sin Saltar " -1 ";
			SiNo
				Si tablero[i,j] < 10 Entonces
					Escribir Sin Saltar "  ", tablero[i,j], " ";
				SiNo
					Escribir Sin Saltar " ", tablero[i,j], " ";
				FinSi
			FinSi
		FinPara
		Escribir "";
	FinPara
	
	Escribir "=======================================";
FinAlgoritmo