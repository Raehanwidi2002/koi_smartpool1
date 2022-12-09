import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koi_smartpool/app/controllers/auth_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailC = TextEditingController();
  final passC = TextEditingController();

  final authC = Get.find<AuthController>();
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          TextField(
            controller: emailC,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: passC,
            decoration: InputDecoration(labelText: "Password"),
          ),
          SizedBox(height: 50,),
          ElevatedButton(
            onPressed:()=> authC.login(emailC.text, passC.text), 
            child: Text("Masuk")
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Belum punya akun?"),
              TextButton(onPressed: ()=> Get.toNamed(Routes.SIGNUP), 
              child: Text("Daftar"))
            ],
          )
        ],),
      )
    );
  }
}
