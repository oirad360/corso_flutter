import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector( // il gesture detector è un widget che permette di catturare i gesti dell'utente, è il widget più completo per la gestione dei gesti
            onTap: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('onTap Alert Dialog'),
                  content: Text('You have tapped on the container.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    )
                  ],
                );
              });
            },
            onDoubleTap: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('onDoubleTap Alert Dialog'),
                  content: Text('You have double tapped on the container.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    )
                  ],
                );
              });
            },
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.deepPurpleAccent,
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
