import 'package:corso_flutter/screens/AuthPage.dart';
import 'package:corso_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:location/location.dart';

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
      home: StreamBuilder( // StreamBuilder è un widget che permette di costruire un widget in base ai dati di uno Stream
        stream: AuthService().userChanges, // lo StreamBuilder si aggancia ad uno Stream, in questo caso userChanges
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return const MyHomePage(title: 'Flutter Demo Home Page');
          } else {
            return const AuthPage();
          }
        },
      )
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

  Future<void> logOut() async {
    try {
      await AuthService().signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Welcome ${AuthService().user!.email}'),
              ElevatedButton(onPressed: () {
                logOut();
              }, child: Text('Logout'))
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Location location = new Location();

            bool _serviceEnabled;
            PermissionStatus _permissionGranted;
            LocationData _locationData;

            _serviceEnabled = await location.serviceEnabled();
            if (!_serviceEnabled) {
              _serviceEnabled = await location.requestService();
              if (!_serviceEnabled) {
                return;
              }
            }

            _permissionGranted = await location.hasPermission();
            if (_permissionGranted == PermissionStatus.denied) {
              _permissionGranted = await location.requestPermission();
              if (_permissionGranted != PermissionStatus.granted) {
                return;
              }
            }

            _locationData = await location.getLocation();

            location.onLocationChanged.listen((LocationData currentLocation) {
              print('cambio location: ${_locationData}');
            });
          },
          child: Icon(Icons.add),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
