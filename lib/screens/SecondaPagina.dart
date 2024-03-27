import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaPagina extends StatefulWidget {
  const SecondaPagina(
      {super.key,
      required this.data}); // possiamo dichiarare nel costruttore eventuali dati aggiuntivi da passare al cambio pagina

  final String data;

  @override
  State<SecondaPagina> createState() => _SecondaPaginaState();
}

// convertiamo la pagina in StatefulWidget per poter gestire le proprietà da passare all' AnimatedContainer
class _SecondaPaginaState extends State<SecondaPagina> {
  double _width = 200; // '_' si usa per nominare variabili private
  double _height = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Seconda Pagina',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(widget.data, style: TextStyle(fontSize: 24)),
            AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: _width,
                height: _height,
                color: _color,
                curve: Curves.fastOutSlowIn // si possono usare diverse curve per l'animazione
            ),
            // è un container che esegue un'animazione al cambio delle proprietà
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    final random = Random();
                    _width = random.nextInt(300).toDouble();
                    _height = random.nextInt(300).toDouble();
                    _color = Color.fromRGBO(random.nextInt(256),
                        random.nextInt(256), random.nextInt(256), 1);
                  });
                },
                child: const Text('Randomizza'))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/prima');
          },
          tooltip: 'Cambia pagina',
          child: const Icon(Icons.change_circle),
        ));
  }
}
