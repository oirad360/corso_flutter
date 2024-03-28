import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 9, // deve matchare il numero di tab
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  indicatorColor: Colors.red, // indicator è la barra sotto la tab selezionata
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 5,
                  // indicator: BoxDecoration( // possiamo personalizzare l'indicator ad esempio utilizzando una BoxDecoration (diventa un rettangolo che copre per intero la tab)
                  //   color: Colors.red,
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  isScrollable: true,
                  tabs: [ // qui possiamo aggiungere tab
                    Tab(icon: Icon(Icons.home), text: 'texdfdsfdt'),
                    Tab(icon: Icon(Icons.video_collection), text: 'texdfdsfdt'),
                    Tab(icon: Icon(Icons.access_alarm), text: 'texdfdsfdt'),
                    Tab(icon: Icon(Icons.abc), text: 'texdfdsfdt'),
                    Tab(icon: Icon(Icons.ac_unit), text: 'texdfdsfdt'),
                    Tab(icon: Icon(Icons.dangerous), text: 'texdfdsfdt'),
                    Tab(icon: Icon(Icons.account_balance_rounded), text: 'texdfdsfdt'),
                    Tab(icon: Icon(Icons.account_balance_rounded), text: 'texdfdsfdt'),
                    Tab(icon: Icon(Icons.account_balance_rounded), text: 'texdfdsfdt'),
                  ],
                ),
              ],
            ),
          ),
          body: const TabBarView( // qui possiamo aggiungere i contenuti rispettivamente della prima e seconda tab (ecc...)
            children: [
              Icon(Icons.home),
              Icon(Icons.video_collection),
              Icon(Icons.access_alarm),
              Icon(Icons.abc),
              Icon(Icons.ac_unit),
              Icon(Icons.dangerous),
              Icon(Icons.account_balance_rounded),
              Icon(Icons.account_balance_rounded),
              Icon(Icons.account_balance_rounded),
            ],
          ),
        ),
      ),
      // onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
