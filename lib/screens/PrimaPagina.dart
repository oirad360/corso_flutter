import 'package:flutter/material.dart';

class PrimaPagina extends StatelessWidget {
  PrimaPagina({super.key});

  final List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(
            child: SizedBox(
              width: 300,
                height: 400,
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/seconda', arguments: 'Ciaooo');
                    },
                    child: Card(
                        elevation: 10,
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            Hero(tag: 'immagine-copertina', // tramite Hero possiamo animare il passaggio di un widget (specificato nel child) da una pagina all'altra, utilizzando lo stesso tag
                            child:Image.asset('images/spiaggia_dipinto.jpg', fit: BoxFit.cover)),
                            const Text('Corso Flutter', style: TextStyle(fontSize: 24)),
                          ],
                        ),
                    ),
                ),
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/seconda',
                arguments: 'Ciaooo'); // passiamo un argomento alla navigazione
          },
          tooltip: 'Cambia pagina',
          child: const Icon(Icons.change_circle),
        ));
  }
}
