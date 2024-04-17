import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Stream<User?> get userChanges => _auth.authStateChanges(); // Stream che notifica i cambiamenti di stato dell'autenticazione dell'utente
  // lo Stream si utilizza per notificare i cambiamenti di un dato, in questo caso dell'utente

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
