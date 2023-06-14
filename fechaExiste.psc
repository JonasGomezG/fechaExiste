//Usar TEX() solo sirve para abreviar codigo
//En su lugar se puede usar ConvertirATexto()
//Si arg es un argumento de tipo entero
//Este subproceso nos devuelve un texto
//Por ej si ejecutamos TEX( 10 )
//Nos devuelve el texto "10"
SubProceso vdr <- TEX( arg )
	Definir vdr Como Caracter ;
	vdr <- ConvertirATexto( arg ) ;
FinSubProceso
//Usar NUM() solo sirve para abreviar codigo
//En su lugar se puede usar ConvertirANumero()
//Si arg es un argumento de tipo texto
//Este subproceso nos devuelve un numero
//Por ej si ejecutamos NUM( "10" )
//Nos devuelve el numero 10
SubProceso vdr <- NUM( arg )
	Definir vdr Como Numero ;
	vdr <- ConvertirANumero( arg ) ;
FinSubProceso

//Declaramos un proceso de nombre N1N2A1A2FechaExiste
//Que ademas debe de coincidir con el nombre del archivo
//Siendo N1 y N2 la/s inicial/es del nombre del estudiante
//Siendo A1 el 1º apellido y A2 la inicial del 2º apellido
Proceso JGGFechaExiste
	//Declaramos variable tipo entero
	//Contendra informacion del numero total de fechas que se estudian
	//can
	definir can Como Entero;
	//Imprimimos por la pantalla la cadena de texto
	//Cantidad de fechas minimo 2 y maximo 10
	Escribir "Cantidad de fechas minimo 2 y maximo 10";
	leer can;
	//Guardamos en variable can la cantidad de fechas
	//Declaramos variables tipo caracter
	//Contendran informacion de las partes de una fecha
	//anyoCa, mesCa, diaCa
	definir anyoCa, mesCa, diaCa Como Caracter;
	//Declaramos variables tipo caracter
	//Contendran informacion del numero de digitos de las partes de una fecha
	//anyoLon, mesLon, diaLon
	definir anyoLon, mesLon, diaLon Como Caracter;
	//Declaramos variables tipo caracter
	//Contendran informacion de la fecha completa y su numero total de digitos
	//fecha, fechaLon
	definir fecha, fechaLon Como Caracter;
	//Declaramos variables tipo entero
	//Contendran informacion de las fechas y su numero de digitos
	//arreglo, arregloLon
	definir arreglo, arregloLon Como Entero;
	//Definimos la dimension igual a diez de las siguientes variables
	//arreglo, arregloLon
	Dimension arreglo[10];
	Dimension arregloLon[10];
	//Declaramos indice tipo entero
	//k
	definir k Como Entero;
	//Que inicializamos a 0
	k <- 0;
	//Bucle dowhile
	//Pedimos informacion al usuario sobre varias fechas distintas
	//Que se guardara con un formato especifico en varios arrays
	//Se ejecuta mientras el indice k sea mayor o igual a la variable can
	Repetir
		//Cuerpo dowhile
		//Imprimimos por la pantalla el string
		//Introduzca año siempre mayor que 0
		//Guardamos en variable anyoCa un año
		Escribir "Introduzca año siempre mayor que 0";
		leer anyoCa;
		//Imprimimos por la pantalla el string
		//Introduzca mes entre 1 y 12
		//Guardamos en variable mesCa un mes
		Escribir "Introduzca mes entre 1 y 12";
		leer mesca;
		//Imprimimos por la pantalla el string
		//Introduzca dia entre 1 y 31
		//Guardamos en variable diaCa un dia
		Escribir "Introduzca dia entre 1 y 31";
		leer diaCa;
		//Asignamos a variable anyoLon el resultado de aplicar funcion TEX
		//Unico parametro funcion Longitud aplicada a variable anyoCa
		anyoLon <- tex(Longitud(anyoCa));
		//Asignamos a variable mesLon el resultado de aplicar funcion TEX
		//Unico parametro funcion Longitud aplicada a variable mesCa
		mesLon <- tex(Longitud(mesCa));
		//Asignamos a variable diaLon el resultado de aplicar funcion TEX
		//Unico parametro funcion Longitud aplicada a variable diaCa
		diaLon <- tex(Longitud(diaCa));
		//Volcamos sobre variable fecha el resultado de aplicar funcion Concatenar
		//Primer parametro funcion Concatenar que une variable anyoCa seguido de variable mesCa
		//Segundo parametro variable diaCa
		fecha <- Concatenar(Concatenar(anyoCa,mesCa),diaCa);
		//Volcamos sobre variable fechaLon el resultado de aplicar funcion Concatenar
		//Primer parametro funcion Concatenar que une variable anyoLon seguido de variable mesLon
		//Segundo parametro variable diaLon
		fechaLon <- Concatenar(Concatenar(anyoLon,mesLon),diaLon);
		//Guardamos en el array llamado arreglo el resultado de aplicar funcion NUM
		//A la variable fecha
		arreglo[k] <- num(fecha);
		//Guardamos en el array llamado arregloLon el resultado de aplicar funcion NUM
		//A la variable fechaLon
		arregloLon[k] <- num(fechaLon);
		//Incrementamos el indice del bucle en una unidad
		k <- k + 1;
	Hasta Que k >= can;
	//Fuera del bucle dowhile
	//Declaramos dos indices y una variable todos de tipo entero
	//i, j, aux
	definir i,j,aux Como Entero;
	//Bucle doble for primario y secundario
	//Aplicamos el algoritmo de ordenamiento de la burbuja
	//Que consiste en ordenar todos los elemenos de un array
	//De menor a mayor tal como se explica a continuacion
	//Bucle for primario con indice i
	//Desde cero hasta variable can menos valor dos
	//Cuerpo for primario
	//Bucle for secundario con indice j
	//Desde cero hasta variable can menos indice i y menos valor dos
	//Cuerpo for secundario
	//Estructura condicional if else
	//Si array arreglo posicion j mayor que array arreglo posicion j mas uno entonces
	//Cuerpo if
	//Asignamos a variable aux el array llamado arreglo posicion j
	//Para copiar el valor del elemento en una variable nueva
	//Asignamos a array arreglo posicion j el mismo array arreglo posicion j mas uno
	//Para sobreescribir un elemento del array por otro
	//Asignamos a array arreglo posicion j mas uno la variable llamada aux
	//Para recuperar el valor copiado cambiandolo de posicion
	para i <- 0 hasta can - 2 Hacer
		para j <- 0 hasta can - i - 2 Hacer
			si arreglo[j] > arreglo[j + 1] Entonces
				aux <- arreglo[j];
				arreglo[j] <- arreglo[j + 1];
				arreglo[j + 1] <- aux;
			FinSi
		FinPara
	FinPara
	//Fuera de los bucles for secundario y primario
	//Declaramos indice tipo entero
	//m
	definir m Como Entero;
	//Que inicializamos a cero
	m <- 0;
	//Imprimimos por la pantalla el string
	//Muestro fechas de menor a mayor
	Escribir "Muestro fechas de menor a mayor";
	//Bucle while
	//Mostramos los elementos de array llamado arreglo
	//Acompañados de una cadena de texto descriptiva
	//Se ejecuta mientras el indice m sea menor que la variable can
	//Cuerpo while
	//Imprimimos por la pantalla en una misma linea
	//String AñoMesDia seguido de un espacio
	//Elemento del array arreglo ya ordenado
	//Incrementamos el indice del bucle en una unidad
	Mientras m < can Hacer
		Escribir "AñoMesDia" , arreglo[m];
		m <- m + 1;
	FinMientras
	//Fuera del bucle while
	//Declaramos variable tipo entero
	//tamanyo
	definir tamanyo Como Entero;
	//Que inicializamos asignandole la variable can menos uno
	tamanyo <- can - 1;
	//Declaramos variables tipo entero
	//Contendran informacion del numero de digitos de las partes de una fecha
	//anyoSub, mesSub, diaSub
	Definir anyoSub, mesSub, diaSub Como Entero;
	//Volcamos en variable anyoSub el resultado de aplicar funcion NUM a la que pasamos funcion Subcadena
	//Primer parametro funcion TEX a la que pasamos array arregloLon y posicion variable tamanyo
	//Segundo parametro valor cero
	//Tercer parametro valor cero
	anyoSub <- num(Subcadena(tex(arregloLon[tamanyo]),0,0));
	//Volcamos en variable mesSub el resultado de aplicar funcion NUM a la que pasamos funcion Subcadena
	//Primer parametro funcion TEX a la que pasamos array arregloLon y posicion variable tamanyo
	//Segundo parametro valor uno
	//Tercer parametro valor uno
	mesSub <- num(Subcadena(tex(arregloLon[tamanyo]),1,1));
	//Volcamos en variable diaSub el resultado de aplicar funcion NUM a la que pasamos funcion Subcadena
	//Primer parametro funcion TEX a la que pasamos array arregloLon y posicion variable tamanyo
	//Segundo parametro valor dos
	//Tercer parametro valor dos
	diaSub <- num(Subcadena(tex(arregloLon[tamanyo]),2,2));
	//Declaramos variables tipo entero
	//Contendran informacion de las partes de una fecha
	//dia, mes, anyo
	definir dia,mes,anyo como entero;
	//Guardamos en variable anyo el resultado de aplicar funcion NUM a la que pasamos funcion Subcadena
	//Primer parametro funcion TEX aplicada a array arreglo y posicion variable tamanyo
	//Segundo parametro valor cero
	//Tercer parametro variable anyoSub menos el valor uno
	anyo <- num(Subcadena(tex(arreglo[tamanyo]),0,anyoSub - 1));
	//Guardamos en variable mes el resultado de aplicar funcion NUM a la que pasamos funcion Subcadena
	//Primer parametro funcion TEX aplicada a array arreglo y posicion variable tamanyo
	//Segundo parametro variable anyoSub
	//Tercer parametro variable anyoSub mas variable mesSub menos valor uno
	mes <- num(Subcadena(tex(arreglo[tamanyo]),anyoSub,(anyoSub + mesSub) - 1));
	//Guardamos en variable dia el resultado de aplicar funcion NUM a la que pasamos funcion Subcadena
	//Primer parametro funcion TEX aplicada a array arreglo y posicion variable tamanyo
	//Segundo parametro variable anyoSub mas variable mesSub
	//Tercer parametro variable anyoSub mas variable mesSub mas variable diaSub menos valor uno
	dia <- num(Subcadena(tex(arreglo[tamanyo]),anyoSub + mesSub,(anyoSub + mesSub + diaSub) - 1));
	//Declaramos variable tipo entero
	//diaMax
	definir diaMax Como Entero;
	//Declaramos variable tipo logico
	//fechaOkay
	definir fechaOkay Como Logico;
	//Que inicializamos a falso
	fechaOkay <- Falso;
	//Estructura condicional if else primaria
	//Si variable mes mayor o igual a uno y tambien variable mes menor o igual a doce entonces
	//Cuerpo if
	//Estructura condicional switch case
	//Evaluamos el switch en funcion de variable mes
	si mes >= 1 y mes <= 12 Entonces
		Segun mes Hacer
			1,3,5,7,8,10,12: diaMax <- 31;
				//Primer case
				//Meses con 31 dias
				//Uno, dos, cinco, siete, ocho, diez, doce
				//Cuerpo case
				//Asignamos a variable diaMax el valor numerico treinta y uno
			4,6,9,11: diaMax <- 30;
				//Segundo case
				//Meses con 30 dias
				//Cuatro, seis, nueve, once
				//Cuerpo case
				//Asignamos a variable diaMax el valor numerico treinta
			2: 
				si anyo/4 = 0 y anyo/100 <> 0 o anyo mod 400 = 0 Entonces
					//Cuerpo if
					//Se le asigna a variable diaMax el valor numerico veintinueve
					diaMax <- 29;
				sino 
					//Cuerpo else
					//Se le asigna a variable diaMax el valor numerico veintiocho
					diaMax <- 28;	
				FinSi
				
				//Tercer case
				//Mes con 28 o 29 dias
				//Dos
				//Cuerpo case
				//Estructura condicional if else
				//Si resto de operar variable anyo entre cuatro es igual a cero
				//Y tambien si resto de operar variable anyo entre cien es distinto de cero
				//O si resto de operar variable anyo entre cuatrocientos es igual a cero entonces
		FinSegun
		si dia >= 1 y dia <= diaMax Entonces
			fechaOkay <- Verdadero;
			//Fuera de estructura condicional switch case
			//Estructura condicional if else secundaria
			//Si variable dia mayor o igual que valor numerico uno
			//Y tambien si variable dia menor o igual que variable diaMax entonces
			//Cuerpo if
			//Asignamos a variable fechaOkay el valor booleano verdadero
		FinSi
	FinSi
	si fechaOkay = Verdadero Entonces
		Escribir "Fecha mas actual si es correcta";
		//Fuera de estructuras condicionales if else secundaria y primaria
		//Estructura condicional if else
		//Si variable fechaOkay es VERDADERO entonces
		//Cuerpo if
		//Imprimimos por la pantalla el string
		//Fecha mas actual si es correcta
		//Imprimimos por la pantalla el string
		Escribir "Año ", anyo, " Mes ", mes, " Dia ", dia;
		//Texto Año variable anyo texto Mes variable mes texto Dia variable dia
		//Cada texto y variable separadas por un espacio
	SiNo
		Escribir "Fecha mas actual no es correcta";
		Escribir "Año ", anyo, " Mes ", mes, " Dia ", dia;
		//Cuerpo else
		//Imprimimos por la pantalla el string
		//Fecha mas actual no es correcta
		//Imprimimos por la pantalla el string
		//Texto Año variable anyo texto Mes variable mes texto Dia variable dia
		//Cada texto y variable separadas por un espacio
	FinSi
	//Se termino el proceso
	//Fin de la codificacion
FinProceso
