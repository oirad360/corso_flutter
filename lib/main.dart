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
  bool _isCheckedCheckbox = false;
  String _genere = 'maschio';
  double _sliderValue = 40;
  bool _isCheckedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                  cursorColor: Theme.of(context).colorScheme.primary,
                  maxLength: 10,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                ),
                Checkbox(value: _isCheckedCheckbox, checkColor: Colors.redAccent, activeColor: Colors.green, onChanged: (value) {
                  setState(() {
                      _isCheckedCheckbox = value!;
                  });
                }),
                Row(
                  children: [
                    // il contenuto della variabile del groupValue (genere) deve corrispondere con il value del Radio che vogliamo selezionare di default
                    Radio(value: 'maschio', groupValue: _genere, onChanged: (value) { // entrambi i Radio devono avere lo stesso groupValue
                      setState(() {
                        _genere = value!;
                      });
                    }),
                    Text('Maschio'),
                    Radio(value: 'femmina', groupValue: _genere, onChanged: (value) {
                      setState(() {
                        _genere = value!;
                      });
                    }),
                    Text('Femmina'),
                  ],
                ),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _sliderValue.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                Switch(value: _isCheckedSwitch, onChanged: (value){
                  setState(() {
                    _isCheckedSwitch = value;
                  });
                })
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
