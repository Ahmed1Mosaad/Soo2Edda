import 'package:firebase_auth/firebase_auth.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/data/repo/Auth/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  @override
  signInWithEmailPassword(String email, String password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  createUserrWithEmailPassword({required String email,required String password}) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
