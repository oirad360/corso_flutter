import 'package:corso_flutter/screens/PaginaErrore.dart';
import 'package:corso_flutter/screens/PrimaPagina.dart';
import 'package:corso_flutter/screens/SecondaPagina.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Ottengo gli argomenti passati alla navigazione, non sono più statici
    final args = settings.arguments;

    switch (settings.name) {
      case '/prima':
        return MaterialPageRoute(builder: (context) => PrimaPagina());
      case '/seconda':
        // Controllo se gli argomenti sono stati passati alla SecondaPagina
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => SecondaPagina(
              data: args,
            ),
          );
        }
        // Se gli argomenti non sono stati passati correttamente, mostro un errore
        return MaterialPageRoute(
          builder: (context) => const PaginaErrore(),
        );
      default:
        // Se non trovo la pagina, mostro un errore
        return MaterialPageRoute(
          builder: (context) => const PaginaErrore(),
        );
    }
  }
}