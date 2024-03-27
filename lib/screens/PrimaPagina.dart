import 'package:flutter/material.dart';
import 'package:corso_flutter/screens/SecondaPagina.dart';
import 'package:corso_flutter/widgets/CardTesto.dart';
import 'package:corso_flutter/widgets/CardVideo.dart';

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
      body: ListView.builder(itemCount: lista.length, itemBuilder: (context, index) {
        if(lista[index] % 2 == 0){
          return CardVideo(numero: lista[index]);
        } else {
          return CardTesto(numero: lista[index]);
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => SecondaPagina(data: 'Ciao')), // cambiamo pagina passando dati aggiuntivi
          ); // il push aggiunge una nuova pagina in una pila, fa comparire la freccia per tornare indietro nell'appbar che fa tornare alla pagina che viene prima nella pila
        }, // noi visualizziamo sullo schermo sempre la pagina che è in cima alla pila
        tooltip: 'Cambia pagina',
        child: Icon(Icons.change_circle),
      )
    );
  }
}
