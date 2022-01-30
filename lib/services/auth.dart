import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticate {

  late String email, password;

  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential signInWithGoogle =
        await auth.signInWithCredential(credential);

        user = signInWithGoogle.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return user;
  }

  Future signinAnon() async {
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      User? user = userCredential.user;

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future signUpWithEmailAndPassword() async {
    try {
      UserCredential signUpWithEmailAndPassword = await auth
          .createUserWithEmailAndPassword(
          email: email,
          password: password);
      User? user = signUpWithEmailAndPassword.user;
      return user;

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

    Future signInWithEmailAndPassword() async {
      try {
        UserCredential signInWithEmailAndPassword = await auth
            .signInWithEmailAndPassword(
            email: email,
            password: password);
        User? user = signInWithEmailAndPassword.user;
        return user;

      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }
