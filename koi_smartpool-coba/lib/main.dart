import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:koi_smartpool/app/controllers/auth_controller.dart';
import 'package:koi_smartpool/app/utils/loading.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await await Firebase.initializeApp();
  runApp(
    MyApp()
  );
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.active){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
        title: "Koi SmartPool",
        initialRoute:snapshot.data != null && snapshot.data!.emailVerified == true ? Routes.HOME:Routes.HOME,
        getPages: AppPages.routes,
      );
        }
      return LoadingView();
    }
    );
  }
}
