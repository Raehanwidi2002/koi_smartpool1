import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

import '../controllers/CircleProgressKuras.dart';

class KurasKolamView extends StatefulWidget {
  @override
  State<KurasKolamView> createState() => _KurasKolamViewState();
}

class _KurasKolamViewState extends State<KurasKolamView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final maxProgrss = 100.0;

  late DatabaseReference _databaseReference;
  bool isPengurasanOn = false; // Represents the ON/OFF state
  bool shouldReverseAnimation =
      false; // Flag to control whether the animation should be reversed

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: 10), // Set the drainage process duration to 10 seconds
    );
    _animation =
        Tween<double>(begin: 0, end: maxProgrss).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });

    _databaseReference = FirebaseDatabase.instance.reference().child('data');

    // Listen for changes in the Firebase data
    _databaseReference.onValue.listen((event) async {
      if (event.snapshot.value != null) {
        Object? firebaseData = event.snapshot.value;
        // Perform actions based on Firebase data (0 for OFF, 1 for ON)
        setState(() {
          isPengurasanOn = (firebaseData == 1);
        });

        if (isPengurasanOn) {
          // Start the drainage process
          _animationController.forward();

          // Use Future.delayed to ensure the animation lasts for the entire duration
          await Future.delayed(Duration(seconds: 10));

          if (shouldReverseAnimation && mounted) {
            // Ensure the widget is still mounted before reversing the animation
            _animationController.reverse(); // Reverse the animation
            shouldReverseAnimation = false; // Reset the flag
          }

          await Future.delayed(Duration(seconds: 3));

          _animationController.reset();
          _showPopUp("Pengurasan Selesai!");

          _databaseReference.set(0);
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 123, 196, 255),
        body: Stack(
          children: [
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
                      topRight: Radius.circular(35),
                    ),
                  ),
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
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 3.5),
                    MaterialButton(
                      onPressed: () {
                        // Toggle the state when the button is pressed
                        isPengurasanOn = !isPengurasanOn;
                        // Update Firebase data based on the state
                        _databaseReference.set(isPengurasanOn ? 1 : 0);

                        if (!isPengurasanOn) {
                          // If turning off, set the flag to reverse the animation
                          shouldReverseAnimation = true;
                        }
                      },
                      color: isPengurasanOn
                          ? Colors.green // ON state color
                          : Color.fromARGB(
                              255, 78, 175, 255), // OFF state color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40,
                      minWidth: 250,
                      child: Text(
                        isPengurasanOn
                            ? 'Matikan Pengurasan'
                            : 'Lakukan Pengurasan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show a pop-up message
  void _showPopUp(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pemberitahuan"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
