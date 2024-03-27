import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaPagina extends StatelessWidget {
  const SecondaPagina(
      {super.key,
      required this.data}); // possiamo dichiarare nel costruttore eventuali dati aggiuntivi da passare al cambio pagina

  final String data;

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
            Text(data, style: TextStyle(fontSize: 24)),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/prima');
          },
          tooltip: 'Cambia pagina',
          child: Icon(Icons.change_circle),
        ));
  }
}
