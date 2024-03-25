import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(children: [
      // abbiamo messo lo Stack al posto del Scaffold, che ora è un figlio dello Stack, quindi lo Stack è il nuovo root widget e occuperà tanto quanto lo schermo
      Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: const TextStyle(
                fontFamily: 'LoversQuarrel', fontWeight: FontWeight.w600),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            for (var i in lista)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListTile( // ListTile è un widget che permette di creare una riga con un titolo, un sottotitolo, un'icona a destra e un'icona a sinistra
                  tileColor: i % 2 == 0 ? Colors.grey[300] : Colors.grey[100],
                  title: Text('Elemento $i'),
                  subtitle: Text('Sottotitolo elemento $i'),
                  trailing: Icon(Icons.drag_handle),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/250?image=${i * 10}'),
                  ),
                  onTap: () {
                    print('Elemento $i premuto');
                  },
                ),
              )

          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
      Positioned(
          // questo widget è posizionato rispetto allo Stack che non è influenzato dallo Scaffold perchè adesso Scaffold è un figlio dello Stack
          // prima avevamo lo Stack nel body dello Scaffold per cui i confini da cui sarebbe dipeso il posizionamento dei children erano stabiliti da esso
          bottom: 100,
          // se, per esempio, potessimo scrollare la pagina, questo widget rimarrebbe sempre a 100 pixel dal fondo dello schermo
          left: 100,
          height: 50,
          width: 50,
          child: Container(
              color: Colors.orangeAccent, child: Icon(Icons.ac_unit))),
    ]);
  }
}
