import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koi_smartpool/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  bool isPressed = false;
  final authC = Get.find<AuthController>();
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          color: Color.fromARGB(255, 78, 175, 255),
          height: 250,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: (() => authC.logout()),
                    icon: Icon(Icons.notifications),
                  ),
                  IconButton(
                      color: Colors.white,
                      onPressed: () => authC.logout(),
                      icon: Icon(Icons.settings))
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 167, 167, 167),
                          borderRadius: BorderRadius.circular(20)),
                      child: Image(
                          image: NetworkImage("https://picsum.photos/110/110"),
                          width: 110,
                          height: 110),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hallo Raehan",
                          style: TextStyle(
                              fontSize: 26,
                              color: Color.fromARGB(255, 32, 32, 32)),
                        ),
                        Text(
                          "Bagaimana harimu - harimu apakah",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                          maxLines: 3,
                        ),
                        Text(
                          "menyenangkan? jangan lupakan ",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                          maxLines: 3,
                        ),
                        Text(
                          "kondisi kolammu ya",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                          maxLines: 3,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.blue,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/temperatur.png"),
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Temperatur Air",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text("Kondisi kolam mu saat ini sedang baik")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.blue,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/kekeruhan.png"),
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kekeruhan Air",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text("Kondisi kolam mu saat ini sedang baik")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.blue,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/ph.png"),
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "pH Air",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text("Kondisi kolam mu saat ini sedang baik")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.blue,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/kuras.png"),
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kontol",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text("Kondisi kolam mu saat ini sedang baik")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
