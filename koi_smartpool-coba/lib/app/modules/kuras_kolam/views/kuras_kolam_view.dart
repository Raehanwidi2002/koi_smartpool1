import 'package:flutter/material.dart';
import 'package:koi_smartpool/app/modules/kuras_kolam/controllers/CircleProgressKuras.dart';

class KurasKolamView extends StatefulWidget {
  @override
  State<KurasKolamView> createState() => _KurasKolamViewState();
}

class _KurasKolamViewState extends State<KurasKolamView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final maxProgrss = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation =
        Tween<double>(begin: 0, end: maxProgrss).animate(_animationController)
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
                    color: Color(0xFFFA8BC7),
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
                      "Kuras Kolam",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    CustomPaint(
                      foregroundPainter: CircleProgressKuras(_animation.value),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(130),
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                "${_animation.value.toInt()}%",
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 3.5),
                    MaterialButton(
                      onPressed: () {},
                      color: Color.fromARGB(255, 78, 175, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      height: 40,
                      minWidth: 250,
                      child: const Text(
                        'Lakukan Pengurasan',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
