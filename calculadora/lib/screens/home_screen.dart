import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const double tamaLetra = 20.0;
  String displayText = "0";
  String operador = "";
  double? primerNumero;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white10,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              calculadoraWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget calculadoraWidget() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                displayText,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          botonFila(["%", "^", "CE", "/"], [aplicarPorcentaje, elevar, borrarEntrada, () => actualizarDisplay("/")]),
          botonFila(["1", "2", "3", Icons.close], [() => actualizarDisplay("1"), () => actualizarDisplay("2"), () => actualizarDisplay("3"), () => actualizarDisplay("*")]),
          botonFila(["4", "5", "6", Icons.remove], [() => actualizarDisplay("4"), () => actualizarDisplay("5"), () => actualizarDisplay("6"), () => actualizarDisplay("-")]),
          botonFila(["7", "8", "9", Icons.add], [() => actualizarDisplay("7"), () => actualizarDisplay("8"), () => actualizarDisplay("9"), () => actualizarDisplay("+")]),
          botonFila(["+/-", "0", ",", "="], [toggleSigno, () => actualizarDisplay("0"), () {}, calcularResultado]),
        ],
      ),
    );
  }

  void actualizarDisplay(String value) {
    setState(() {
      displayText = displayText == "0" ? value : displayText + value;
    });
  }

  void aplicarPorcentaje() {
    setState(() {
      primerNumero = double.tryParse(displayText);
      operador = "%";
      displayText = "0";
    });
  }

  void calcularResultado() {
    if (operador == "%" && primerNumero != null) {
      double segundoNumero = double.tryParse(displayText) ?? 0;
      double resultado = (primerNumero! * segundoNumero) / 100;
      setState(() {
        displayText = resultado.toString();
      });
    } else if (operador == "^" && primerNumero != null) {
      double exponente = double.tryParse(displayText) ?? 1;
      num resultado = pow(primerNumero!, exponente);
      setState(() {
        displayText = resultado.toString();
      });
    } else {
      try {
        final expression = Expression.parse(displayText);
        const evaluator = ExpressionEvaluator();
        final result = evaluator.eval(expression, {});
        setState(() {
          displayText = result.toString();
        });
      } catch (e) {
        setState(() {
          displayText = "Error";
        });
      }
    }
    operador = "";
    primerNumero = null;
  }

  void elevar() {
    setState(() {
      primerNumero = double.tryParse(displayText);
      operador = "^";
      displayText = "0";
    });
  }

  void borrarEntrada() {
    setState(() {
      displayText = "0";
      operador = "";
      primerNumero = null;
    });
  }

  void toggleSigno() {
    setState(() {
      if (displayText.startsWith("-")) {
        displayText = displayText.substring(1);
      } else {
        displayText = "-$displayText";
      }
    });
  }

  Widget botonFila(List<dynamic> items, List<VoidCallback> actions) {
    return Expanded(
      child: Row(
        children: List.generate(items.length, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ElevatedButton(
                onPressed: actions[index],
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 36.0),
                ),
                child: items[index] is IconData
                    ? Icon(items[index] as IconData)
                    : Text(
                        items[index].toString(),
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
