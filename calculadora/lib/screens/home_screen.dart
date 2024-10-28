import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Tamaño de la letra usado en los botones
  static const double tamaLetra = 20.0;

  // Variable que almacena el texto mostrado en pantalla
  String displayText = "0";

  // Variable para almacenar el operador actual seleccionado
  String operador = "";

  // Variable que almacena el primer número de una operación
  double? primerNumero;

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz principal de la aplicación
    return MaterialApp(
      // Título de la aplicación
      title: 'Calculadora', 
      theme: ThemeData(
        // Color de fondo
        scaffoldBackgroundColor: Colors.white10, 
      ),
      // Oculta el banner de debug en la esquina
      debugShowCheckedModeBanner: false, 
      // Creo un área segura para los widgets
      home: SafeArea( 
        child: Scaffold(
          // Organizo los widgets en una columna
          body: Column( 
            children: <Widget>[
              // Llamo al método que crea el widget de la calculadora
              calculadoraWidget(), 
            ],
          ),
        ),
      ),
    );
  }

  // Método que construye el widget de la calculadora
  Widget calculadoraWidget() {
    return Expanded( 
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // Alineo el texto al centro-derecha
              alignment: Alignment.centerRight, 
              // Agrego un padding alrededor del texto
              padding: const EdgeInsets.all(16.0), 
              child: Text(
                // Muestro el valor actual del display
                displayText, 
                style: const TextStyle(
                  // Tamaño de la fuente del texto en el display
                  fontSize: 50, 
                  // Color blanco para el texto
                  color: Color.fromARGB(255, 255, 255, 255), 
                  // Texto en negrita
                  fontWeight: FontWeight.bold, 
                ),
              ),
            ),
          ),
          // Filas de botones con etiquetas y funciones específicas
          botonFila(
            ["%", "^", "CE", "/"],
            [aplicarPorcentaje, elevar, borrarEntrada, () => actualizarDisplay("/")]
          ),
          botonFila(
            ["1", "2", "3", Icons.close],
            [() => actualizarDisplay("1"), () => actualizarDisplay("2"), () => actualizarDisplay("3"), () => actualizarDisplay("*")]
          ),
          botonFila(
            ["4", "5", "6", Icons.remove],
            [() => actualizarDisplay("4"), () => actualizarDisplay("5"), () => actualizarDisplay("6"), () => actualizarDisplay("-")]
          ),
          botonFila(
            ["7", "8", "9", Icons.add],
            [() => actualizarDisplay("7"), () => actualizarDisplay("8"), () => actualizarDisplay("9"), () => actualizarDisplay("+")]
          ),
          botonFila(
            ["+/-", "0", ",", "="],
            [toggleSigno, () => actualizarDisplay("0"), () {}, calcularResultado]
          ),
        ],
      ),
    );
  }

  // Actualiza el valor mostrado en pantalla
  void actualizarDisplay(String value) {
    setState(() { // Notifica a Flutter que el estado ha cambiado y que se debe volver a construir la UI
      // Si el valor actual es "0", lo reemplaza; si no, concatena el nuevo valor
      displayText = displayText == "0" ? value : displayText + value;
    });
  }

  // Aplica el operador de porcentaje
  void aplicarPorcentaje() {
    setState(() { // Notifica a Flutter que el estado ha cambiado
      // Intenta convertir el texto actual en un número y lo guarda como primerNumero
      primerNumero = double.tryParse(displayText);
      //Establezco el operador como "%"
      operador = "%";
      // Reseteo el display para el siguiente número
      displayText = "0"; 
    });
  }

  // Calcula el resultado de la operación seleccionada
  void calcularResultado() {
    // Si el operador es "%" y hay un primer número
    if (operador == "%" && primerNumero != null) {
      // Intenta convertir el string a un numero double
      double segundoNumero = double.tryParse(displayText) ?? 0;
      // Calcula el porcentaje
      double resultado = (primerNumero! * segundoNumero) / 100;
      // Actualiza el estado
      setState(() { 
        // Muestra el resultado
        displayText = resultado.toString();
      });
    } else if (operador == "^" && primerNumero != null) {
      // Si el operador es "^"
      // Intenta obtener el exponente, cambia el string a numero double y hace la cuenta
      double exponente = double.tryParse(displayText) ?? 1; 
      num resultado = pow(primerNumero!, exponente);
      setState(() { // Actualiza el estado
        displayText = resultado.toString(); // Muestra el resultado
      });
    } else {
      // Intenta evaluar expresiones generales si no es "%" ni "^"
      try {
        // Analiza la expresión
        final expression = Expression.parse(displayText); 
        // Crea un evaluador
        const evaluator = ExpressionEvaluator();  
        // Evalúa la expresión
        final result = evaluator.eval(expression, {});
        // Actualiza el estado
        setState(() { 
          // Muestra el resultado
          displayText = result.toString(); 
        });
      } catch (e) {
        // Si ocurre una excepción, muestra "Error"
        setState(() { 
          displayText = "Error";
        });
      }
    }
    // Resetea el operador y primerNumero después de calcular
    operador = ""; 
    primerNumero = null; 
  }

  // Hace una operación de potencia
  void elevar() {
    // Notifica a Flutter que el estado ha cambiado
    setState(() { 
      // Guarda el número actual como primerNumero
      primerNumero = double.tryParse(displayText);
      // Establece el operador como "^"
      operador = "^"; 
      // Resetea el display para el siguiente número
      displayText = "0"; 
    });
  }

  // Borra el valor actual y resetea operador y primerNumero
  void borrarEntrada() {
    // Notifica a Flutter que el estado ha cambiado
    setState(() {
      // Resetea el display
      displayText = "0"; 
      // Limpia el operador
      operador = ""; 
      // Resetea el primer número
      primerNumero = null; 
    });
  }

  // Alterna el signo del número actual
  void toggleSigno() {
    // Notifica a Flutter que el estado ha cambiado
    setState(() { 
      // Si el texto comienza con "-", quita el signo
      if (displayText.startsWith("-")) {
        displayText = displayText.substring(1);
      } else {
        // Si no, agrega el signo negativo
        displayText = "-$displayText"; 
      }
    });
  }

  // Crea una fila de botones para la calculadora que tienen un valor dinámico y una función que no devuelve nada
  Widget botonFila(List<dynamic> items, List<VoidCallback> actions) {
    return Expanded(
      child: Row(
        children: List.generate(items.length, (index) { 
          // Genera los botones según la cantidad de items
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0), 
              // Espaciado horizontal entre botones
              child: ElevatedButton( 
                // Asigna la acción correspondiente al botón
                onPressed: actions[index], 
                style: ElevatedButton.styleFrom( 
                  // Tamaño del botón
                  padding: const EdgeInsets.symmetric(vertical: 36.0), 
                ),
                // Verifica si el item es un ícono
                child: items[index] is IconData 
                // Muestra el ícono si es un IconData
                    ? Icon(items[index] as IconData) 
                    : Text(
                      // Muestra texto si es String
                        items[index].toString(), 
                        // Tamaño de fuente
                        style: const TextStyle(fontSize: tamaLetra), 
                      ),
              ),
            ),
          );
        }),
      ),
    );
  }
}