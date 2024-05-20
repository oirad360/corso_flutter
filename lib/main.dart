import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/album.dart';
import 'dart:convert'; // per utilizzare i metodi di 'json' (es. json.decode)

Future<http.Response> fetchData() {
  // Future è un tipo di dato asincrono
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
}

Future<List<Album>> fetchAlbums() async {
  List<Album> albums = [];
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  var body = json.decode(response
      .body); // body sarà una lista di mappe, ma non lo sappiamo a priori quindi usiamo var
  for (var i = 0; i < body.length; i++) {
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
      home: MyHomePage(
          title: defaultTargetPlatform == TargetPlatform.android
              ? 'Android Demo App'
              : defaultTargetPlatform == TargetPlatform.iOS
                  ? 'iOS Demo App'
                  : 'Demo App'),
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
  String dropDownVal = "val1";
  String popupMenuVal = "val1";

  @override
  void initState() {
    // le chiamate asincrone vanno fatte nel metodo initState
    super.initState();
    albums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width; // larghezza dello schermo
    return Scaffold(
        backgroundColor: size < 600 ? Colors.white : Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'val1',
                  child: Text('ciao'),
                ),
                const PopupMenuItem(
                  value: 'val2',
                  child: Text('ciaoooo'),
                ),
              ];
            }, onSelected: (String value) {
              setState(() {
                this.popupMenuVal = value;
                print(value);
              });
            })
          ],
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Container(
                child: DropdownButton<String>(
              items: const [
                DropdownMenuItem(
                  child: Text("Ciao"),
                  value: "val1",
                ),
                DropdownMenuItem(
                  child: Text("Ciaooo"),
                  value: 'val2',
                )
              ],
              onChanged: (String? value) {
                setState(() {
                  this.dropDownVal = value!;
                });
              },
              value: dropDownVal,
            ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          backgroundColor: Colors.blue,
          iconSize: 30.0,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: "Alarm",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Business",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "School",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
