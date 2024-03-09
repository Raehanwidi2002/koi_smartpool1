import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> streamAuthStatus() {
    return auth.authStateChanges();
  }

  void signup(String nama, String email, String password) async {
    try {
      UserCredential MyUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await MyUser.user!.sendEmailVerification();
      CollectionReference pengguna = firestore.collection("pengguna");

      await pengguna.add({"nama": nama, "password": password, "email": email});
      Get.defaultDialog(
          title: "Verifikasi Email",
          middleText: "Kami telah mengirimkan email verifikasi ke $email.",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya, Saya akan cek email");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
            title: "Gagal mendaftar",
            middleText: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
            title: "Gagal Mendaftar", middleText: "Email sudah terdaftar");
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential MyUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (MyUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: "Login Gagal",
            middleText:
                "Verifikasi email terlebih dahulu. Apakah belum menrima verivikasi?",
            onConfirm: () async {
              await MyUser.user!.sendEmailVerification();
              Get.back();
            },
            textConfirm: "Kirim Ulang",
            textCancel: "Kembali");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email belum terdaftar');
        Get.defaultDialog(
            title: "Login Gagal", middleText: "Email belum terdaftar");
      } else if (e.code == 'wrong-password') {
        print('Password Salah.');
        Get.defaultDialog(title: "Login Gagal", middleText: "Password Salah");
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
