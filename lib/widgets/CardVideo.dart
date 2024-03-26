import 'package:flutter/material.dart';

// digitare 'stless' e premere invio per generare un widget stateless
class CardVideo extends StatelessWidget {
  const CardVideo({super.key, required this.numero});
  final int numero; // se dichiaro il costruttore come const, devo dichiarare le variabili come final

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.orange[300],
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      child: Text('$numero'),
    );
  }
}