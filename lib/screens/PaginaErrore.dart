import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaErrore extends StatelessWidget {
  const PaginaErrore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Demo Home Page'),
        ),
        body: const Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Errore',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
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
