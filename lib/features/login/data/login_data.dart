import 'package:firebase_auth/firebase_auth.dart';

class LoginData {
  Future<User?> login(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Login failed";
    }
  }

  Future<User?> validateToken(String token) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final user = auth.currentUser;
      if (user != null && user.uid == token) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
