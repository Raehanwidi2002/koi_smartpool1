import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final emailC = TextEditingController();
  final passC = TextEditingController();

  final authC = Get.find<AuthController>();
  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
           Container(
            width: 200,
            height: 200,
            child: Image(image: AssetImage("images/koi.png")),
          ),
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
            onPressed:()=> authC.signup(emailC.text, passC.text), 
            child: Text("Daftar")
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sudah punya akun?"),
              TextButton(onPressed: ()=> Get.back(), 
              child: Text("Masuk"))
            ],
          )
        ],),
      ));
  }
}
