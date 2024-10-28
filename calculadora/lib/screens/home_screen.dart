import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const tama = TextStyle(fontSize: 30);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white10,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              calculadoraWidget(context), // Resto del diseño
            ],
          ),
        ),
      ),
    );
  }

  Widget calculadoraWidget(BuildContext context) {
    const double tamaLetra = 20.0;

    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold
                    )
                  ),
                ],
              ),
            ),
          ), // Text Top


          Expanded(
  child: Row(
    children: <Widget>[
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "1",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Espacio entre botones
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "2",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Espacio entre botones
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "3",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Espacio entre botones
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
          ),
          child: const Icon(Icons.close),
        ),
      ),
    ],
  ),
), // Row 1/2

          Expanded(
  child: Row(
    children: <Widget>[
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "4",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Espacio entre botones
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "5",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Espacio entre botones
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "6",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Espacio entre botones
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
          ),
          child: const Icon(Icons.remove),
        ),
      ),
    ],
  ),
),

          Expanded(
  child: Row(
    children: <Widget>[
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "1",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Espacio entre botones
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "2",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Espacio entre botones
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
          ),
          child: const Text(
            "3",
            style: TextStyle(fontSize: tamaLetra),
          ),
        ),
      ),
      const SizedBox(width: 8.0), 
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    ],
  ),
),

          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 36.0), // Ajusta la altura
                  ),
                  child: const Text(
                    "+/-",
                    style: TextStyle(fontSize: tamaLetra)
                  ),
                ),
              ),
              const SizedBox(width: 8.0), // Espacio entre botones
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 36.0), // Ajusta la altura
                  ),
                  child: const Text(
                    "0",
                    style: TextStyle(fontSize: tamaLetra),
                  ),
                ),
              ),
              const SizedBox(width: 8.0), // Espacio entre botones
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 36.0), // Ajusta la altura
                  ),
                  child: const Text(
                    ",",
                    style: TextStyle(fontSize: tamaLetra)
                  ),
                ),
              ),
              const SizedBox(width: 8.0), // Espacio entre botones
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 36.0), // Ajusta la altura
                  ),
                 child: const Text(
                    "=",
                    style: TextStyle(fontSize: tamaLetra)
                  ),
                ),
              ),
            ])
          ), // Row 2/2 // Text Bottom
        ],
      )
    );
  }
}