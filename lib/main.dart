import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/album.dart';
import 'dart:convert'; // per utilizzare i metodi di 'json' (es. json.decode)

Future<http.Response> fetchData() { // Future è un tipo di dato asincrono
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
}

Future<List<Album>> fetchAlbums() async {
  List<Album> albums = [];
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  var body = json.decode(response.body); // body sarà una lista di mappe, ma non lo sappiamo a priori quindi usiamo var
  for(var i=0; i<body.length; i++) {
    albums.add(Album.fromJson(body[i]));
  }
  return albums;
}

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
  final _formKey = GlobalKey<FormState>(); // usiamo una chiave per gestire lo stato del form
  bool _checkBoxValue = false;
  Map data = {"nome": "", "cognome": ""};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        ////////////////// NOTA //////////////////
        // per creare form in Flutter si consiglia di usare queste 2 librerie:
        // flutter_form_builder: https://pub.dev/packages/flutter_form_builder
        // form_builder_validators: https://pub.dev/packages/form_builder_validators
        //////////////////////////////////////////
        body: Form( // wrappiamo tutto in un Form
          key: _formKey,
          child: Column(
              children: [
                TextFormField( // non uso più TextField ma TextFormField, che presenta il validator e il metodo onSave
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inserisci il nome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    data['nome'] = value!;
                  },
                  textInputAction: TextInputAction.next, // Cambia il tasto in basso a destra della tastiera (in questo caso mando il focus al prossimo campo)
                  decoration: InputDecoration(
                    label: Text('Nome'),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inserisci il cognome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    data['cognome'] = value!;
                  },
                  textInputAction: TextInputAction.done, // chiudo la tastiera
                  decoration: InputDecoration(
                    label: Text('Cognome'),
                  ),
                ),
                FormField(builder: (state) { // questo è un FormField personalizzato, in questo caso lo utilizziamo per creare una checkbox con validazione (non esiste un widget apposito come TextFormField per le checkbox)
                  return Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(value: _checkBoxValue, onChanged: (value) {
                            setState(() {
                              _checkBoxValue = value!;
                            });
                          }),
                          Text('Accetta i termini e le condizioni')
                        ]
                      ),
                      if (state.hasError)
                        Text(
                          state.errorText!,
                          style: TextStyle(color: Colors.red),
                        )
                    ]
                  );
                },
                validator: (value) {
                  if(!_checkBoxValue) {
                    return 'Devi accettare i termini e le condizioni';
                  } else {
                    return null;
                  }
                }),
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save(); // triggera il metodo onSave di TextFormField
                    print(data);
                  }
                }, child: Text('Invia'))
              ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
