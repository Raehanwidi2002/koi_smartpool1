import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koi_smartpool/app/modules/temperatur_air/controllers/CircleProgressTemperatur.dart';

import '../../../controllers/fuzzy_logic_controller.dart';

class TemperaturAirView extends StatefulWidget {
  @override
  State<TemperaturAirView> createState() => _TemperaturAirViewState();
}

class _TemperaturAirViewState extends State<TemperaturAirView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  var p = Get.find<FuzzyLogicController>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween<double>(begin: 0, end: p.temperatureB)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    _animationController.forward();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 123, 196, 255),
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height / 3.2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF8CA5FF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
              ),
            ],
          ),
          Container(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Temperatur Air",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    CustomPaint(
                      foregroundPainter:
                          CircleProgressTemperatur(_animation.value),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(130),
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                "${_animation.value.toInt()}°C",
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 3.5),
                    Text(p.temperatureCondition,
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    SizedBox(height: 50),
                    Image(
                      image: AssetImage("images/temperatur.png"),
                      width: 60,
                      height: 60,
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
