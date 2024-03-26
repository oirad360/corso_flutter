import 'package:flutter/material.dart';

// digitare 'stful' e premere invio per generare un widget stateful (verranno generate due classi CardTesto e _CardTestoState)
class CardTesto extends StatefulWidget {
  CardTesto({super.key, required this.numero});
  // le variabili non possono essere final perchè rappresentano lo stato del widget, di conseguenza il costruttore non può essere const
  int numero;

  @override
  State<CardTesto> createState() => _CardTestoState();
}

class _CardTestoState extends State<CardTesto> {
  @override
  Widget build(BuildContext context) {
    // da qua dentro posso accedere alle variabili di stato dichiarate in CardTesto tramite 'widget.nomeVariabile'
    return GestureDetector(
      onTap: () {
        setState(() {
          // Incrementa il valore di 'numero' ogni volta che il child viene cliccato
          widget.numero++;
        });
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.orange[600],
        margin: const EdgeInsets.only(bottom: 10),
        height: 100,
        child: Text('${widget.numero}'),
      ),
    );
  }
}