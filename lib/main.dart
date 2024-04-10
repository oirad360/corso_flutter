import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/album.dart';
import 'dart:convert'; // per utilizzare i metodi di 'json' (es. json.decode)
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  late Future<List<Album>> albums;

  @override
  void initState() { // le chiamate asincrone vanno fatte nel metodo initState
    super.initState();
    albums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: FutureBuilder( // FutureBuilder è un widget che permette di costruire un widget in base al risultato di una Future
          future: albums, // la future che vogliamo aspettare è 'albums', che viene inizializzata dalla chiamata a fetchAlbums() nel metodo initState
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length, // data potrebbe essere null, quindi usiamo '!'
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('[$index] ${snapshot.data![index].title}'),
                  );
                },
              );
            }else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
