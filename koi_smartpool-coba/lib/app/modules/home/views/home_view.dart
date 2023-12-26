import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koi_smartpool/app/controllers/auth_controller.dart';
import 'package:koi_smartpool/app/modules/kekeruhan_air/views/kekeruhan_air_view.dart';
import 'package:koi_smartpool/app/modules/kuras_kolam/views/kuras_kolam_view.dart';
import 'package:koi_smartpool/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:koi_smartpool/app/modules/pH_air/views/p_h_air_view.dart';
import 'package:koi_smartpool/app/modules/temperatur_air/views/temperatur_air_view.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../controllers/fuzzy_logic_controller.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  bool isPressed = false;
  final authC = Get.find<AuthController>();
  var p = Get.find<FuzzyLogicController>();
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        height: height / 4,
        showChildOpacityTransition: true,
        animSpeedFactor: 2,
        color: Colors.blue,
        backgroundColor: Color.fromARGB(255, 138, 202, 255),
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return ListView(children: [
              Container(
                height: height / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 90, 181, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotifikasiView()),
                            );
                          },
                          icon: Icon(Icons.notifications),
                        ),
                        IconButton(
                            color: Colors.white,
                            onPressed: () => authC.logout(),
                            icon: Icon(Icons.logout_sharp))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.network(
                                  "https://loremflickr.com/640/360",
                                  fit: BoxFit.cover),
                            ),
                          )),
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
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: 'Varela_Round'),
                              ),
                              Text(
                                "Bagaimana harimu - harimu apakah",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Varela_Round'),
                                maxLines: 3,
                              ),
                              Text(
                                "menyenangkan? ",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Varela_Round'),
                                maxLines: 3,
                              ),
                              Text(
                                "kondisi kolammu Saat ini Sedang ${p.conditionB}",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Varela_Round'),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TemperaturAirView()),
                    );
                  },
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
                                  fontSize: 24, fontFamily: 'Varela_Round'),
                            ),
                            Text(
                                "Suhu: ${p.temperatureB.toInt()} °C | Kondisi: ${p.temperatureCondition} ")
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KekeruhanAirView()),
                    );
                  },
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
                                  fontSize: 24, fontFamily: 'Varela_Round'),
                            ),
                            Text(
                                "Kekeruhan: ${p.turbidityB.toInt()} NTU | Kondisi: ${p.turbidityCondition}")
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PHAirView()),
                    );
                  },
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
                                  fontSize: 24, fontFamily: 'Varela_Round'),
                            ),
                            Text(
                                "pH: ${p.pHB.toInt()}  | Kondisi: ${p.pHCondition}")
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KurasKolamView()),
                        );
                      },
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kuras Kolam",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Varela_Round',
                                      ),
                                    ),
                                    Text(
                                      "Kondisi kolam mu saat ini sedang ${p.conditionB}",
                                      softWrap:
                                          true, // Mengizinkan teks melanjutkan ke baris bawahnya
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))))
            ]);
          },
        ),
      ),
    );
  }
}
