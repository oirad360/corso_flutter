import 'package:flutter/material.dart';

class SecondaPagina extends StatefulWidget {
  const SecondaPagina(
      {super.key,
      required this.data});

  final String data;

  @override
  State<SecondaPagina> createState() => _SecondaPaginaState();
}

class _SecondaPaginaState extends State<SecondaPagina> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Column(children: [
          Hero(
              tag: 'immagine-copertina',
              child: Image.asset('images/spiaggia_dipinto.jpg',
                  fit: BoxFit.cover)),
          const Text(
            'Benvenuto nel Corso Flutter!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(widget.data, style: const TextStyle(fontSize: 24)),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/prima');
          },
          tooltip: 'Cambia pagina',
          child: const Icon(Icons.change_circle),
        ));
  }
}
