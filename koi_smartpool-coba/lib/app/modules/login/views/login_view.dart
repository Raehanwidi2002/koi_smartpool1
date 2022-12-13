import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koi_smartpool/app/controllers/auth_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  bool _obscureText =true;
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 243, 255),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () => FocusScope.of(context),
          child: SizedBox(
            child: Stack(
              children: [
                Container(
                  height: height / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 78, 175, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Image.asset('images/koi.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                    child: SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: height / 1.9,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 40),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Login Account",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            SizedBox(
                                height: 40,
                                child: Input(
                                  hint: 'Email',
                                  icon: Icons.email_outlined,
                                  kontrol: emailC,
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                                height: 40,
                                child: TextField(
                                  
                                  controller: passC,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(26),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 209, 209, 209))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(26),
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    suffixIcon: IconButton(onPressed: (){
                                      setState((){
                                        _obscureText = !_obscureText;
                                      });
                                    }, icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility)),
                                  ),
                                  obscureText: _obscureText,
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            MaterialButton(
                              onPressed: () =>
                                  authC.login(emailC.text, passC.text),
                              color: Color.fromARGB(255, 78, 175, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31)),
                              height: 40,
                              child: const Text(
                                'Masuk',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Belum punya akun?"),
                                TextButton(
                                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                                    child: Text("Daftar"))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}

class Input extends StatelessWidget {
  const Input(
      {Key? key, required this.hint, required this.icon, required this.kontrol})
      : super(key: key);

  final String hint;
  final IconData icon;
  final TextEditingController kontrol;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: kontrol,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          isDense: true,
          labelText: hint,
          labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 209, 209, 209))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: BorderSide(color: Colors.blue)),
          suffixIcon: Icon(icon)),
    );
  }
}





// Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(children: [
//           Container(
//             width: 350,
//             height: 350,
//             child: Image(image: AssetImage("images/koi.png")),
//           ),
//           TextField(
//             controller: emailC,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: "Email"),
//           ),
//           SizedBox(height: 10,),
//           TextField(
//             controller: passC,
//             obscureText: true,
//             decoration: InputDecoration(
//               fillColor: Colors.blue,
//               border: OutlineInputBorder(), 
//               labelText: "Password"),
//           ),
//           SizedBox(height: 50,),
//           ElevatedButton(
//             onPressed:()=> authC.login(emailC.text, passC.text), 
//             child: Text("Masuk"),
//             style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(
//                       horizontal: 40.0, vertical: 20.0),
//                       shadowColor: Colors.deepPurpleAccent,
//                       shape: StadiumBorder(),
//                       backgroundColor: Colors.white
//                     )
//           ),
//           SizedBox(height: 50,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Belum punya akun?"),
//               TextButton(onPressed: ()=> Get.toNamed(Routes.SIGNUP), 
//               child: Text("Daftar"))
//             ],
//           )
//         ],),
//       )