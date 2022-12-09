import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
   FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> streamAuthStatus(){
    return auth.authStateChanges();
  }

  void signin(){}
  void login(){}
  void logout(){}
}
