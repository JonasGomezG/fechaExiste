SubProceso vdr <- TEX( arg )
	Definir vdr Como Caracter ;
	vdr <- ConvertirATexto( arg ) ;
FinSubProceso

SubProceso vdr <- NUM( arg )
	Definir vdr Como Numero ;
	vdr <- ConvertirANumero( arg ) ;
FinSubProceso

Proceso JGGFechaExiste
	definir can Como Entero;
	Escribir "Cantidad de fechas minimo 2 y maximo 10";
	leer can;
	definir anyoCa, mesCa, diaCa Como Caracter;
	definir anyoLon, mesLon, diaLon Como Caracter;
	definir fecha, fechaLon Como Caracter;
	definir arreglo, arregloLon Como Entero;
	Dimension arreglo[10];
	Dimension arregloLon[10];
	definir k Como Entero;
	k <- 0;
	Repetir
		Escribir "Introduzca año siempre mayor que 0";
		leer anyoCa;
		Escribir "Introduzca mes entre 1 y 12";
		leer mesca;
		Escribir "Introduzca dia entre 1 y 31";
		leer diaCa;
		anyoLon <- tex(Longitud(anyoCa));
		mesLon <- tex(Longitud(mesCa));
		diaLon <- tex(Longitud(diaCa));a
		fecha <- Concatenar(Concatenar(anyoCa,mesCa),diaCa);
		fechaLon <- Concatenar(Concatenar(anyoLon,mesLon),diaLon);
		arreglo[k] <- num(fecha);
		arregloLon[k] <- num(fechaLon);
		k <- k + 1;
	Hasta Que k >= can;
	definir i,j,aux Como Entero;
	para i <- 0 hasta can - 2 Hacer
		para j <- 0 hasta can - i - 2 Hacer
			si arreglo[j] > arreglo[j + 1] Entonces
				aux <- arreglo[j];
				arreglo[j] <- arreglo[j + 1];
				arreglo[j + 1] <- aux;
			FinSi
		FinPara
	FinPara
	definir m Como Entero;
	m <- 0;
	Escribir "Muestro fechas de menor a mayor";
	Mientras m < can Hacer
		Escribir "AñoMesDia" , arreglo[m];
		m <- m + 1;
	FinMientras
	definir tamanyo Como Entero;
	tamanyo <- can - 1;
	Definir anyoSub, mesSub, diaSub Como Entero;
	anyoSub <- num(Subcadena(tex(arregloLon[tamanyo]),0,0));
	mesSub <- num(Subcadena(tex(arregloLon[tamanyo]),1,1));
	diaSub <- num(Subcadena(tex(arregloLon[tamanyo]),2,2));
	definir dia,mes,anyo como entero;
	anyo <- num(Subcadena(tex(arreglo[tamanyo]),0,anyoSub - 1));
	mes <- num(Subcadena(tex(arreglo[tamanyo]),anyoSub,(anyoSub + mesSub) - 1));
	dia <- num(Subcadena(tex(arreglo[tamanyo]),anyoSub + mesSub,(anyoSub + mesSub + diaSub) - 1));
	definir diaMax Como Entero;
	definir fechaOkay Como Logico;
	fechaOkay <- Falso;
	si mes >= 1 y mes <= 12 Entonces
		Segun mes Hacer
			1,3,5,7,8,10,12: diaMax <- 31;
			4,6,9,11: diaMax <- 30;
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
		FinSegun
		si dia >= 1 y dia <= diaMax Entonces
			fechaOkay <- Verdadero;
		FinSi
	FinSi
	si fechaOkay = Verdadero Entonces
		Escribir "Fecha mas actual si es correcta";
		Escribir "Año ", anyo, " Mes ", mes, " Dia ", dia;
	SiNo
		Escribir "Fecha mas actual no es correcta";
		Escribir "Año ", anyo, " Mes ", mes, " Dia ", dia;
	FinSi
FinProceso
