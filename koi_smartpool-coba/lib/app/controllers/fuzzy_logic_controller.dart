import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class FuzzyLogicController extends GetxController {
  double turbidityB = 0;
  double temperatureB = 0;
  double pHB = 0;
  String conditionB = '';
  String turbidityCondition = '';
  String temperatureCondition = '';
  String pHCondition = '';

  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    databaseReference.child('SmartPool').onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;

        if (data != null) {
          double suhuDB = data['suhu']?.toDouble() ?? 0.0;
          double kekeruhanDB = data['kekeruhan']?.toDouble() ?? 0.0;
          double pHDB = data['pHair']?.toDouble() ?? 0.0;

          turbidityB = kekeruhanDB; // Assign nilai kekeruhan air dari database
          temperatureB = suhuDB; // Assign nilai suhu air dari database
          pHB = pHDB; // Assign nilai pH air dari database

          conditionB = determineCondition();
          print(turbidityB);
          print(temperatureB);
          print(pHB);
          print(data);

          update();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Method yang digunakan untuk menentukan kondisi kolam
  String determineCondition() {
    // Menentukan kondisi kekeruhan air

    if (turbidityB <= 10) {
      turbidityCondition = 'Sangat Jernih';
    } else if (turbidityB > 10 && turbidityB <= 25) {
      turbidityCondition = 'Jernih';
    } else if (turbidityB > 25 && turbidityB <= 50) {
      turbidityCondition = 'Sedikit Keruh';
    } else if (turbidityB > 50 && turbidityB <= 75) {
      turbidityCondition = 'Keruh';
    } else {
      turbidityCondition = 'Sangat Keruh';
    }

    // Menentukan kondisi suhu air
    if (temperatureB <= 20) {
      temperatureCondition = 'Dingin';
    } else if (temperatureB > 20.0 && temperatureB <= 25.0) {
      temperatureCondition = 'Sedang';
    } else if (temperatureB > 25.0 && temperatureB <= 30.0) {
      temperatureCondition = 'Hangat';
    } else if (temperatureB > 30.0 && temperatureB <= 35.0) {
      temperatureCondition = 'Panas';
    } else {
      temperatureCondition = 'Sangat Panas';
    }
// Menentukan kondisi pH air

    if (pHB < 6.5) {
      pHCondition = 'Asam';
    } else if (pHB >= 6.5 && pHB <= 7.5) {
      pHCondition = 'Netral';
    } else {
      pHCondition = 'Basa';
    }

// Menentukan kondisi kolam berdasarkan kondisi kekeruhan air, suhu air, dan pH air
    if (turbidityCondition == 'Sangat Jernih' &&
        temperatureCondition == 'Sedang' &&
        pHCondition == 'Netral') {
      return 'Sangat Baik';
    } else if (turbidityCondition == 'Jernih' &&
        temperatureCondition == 'Sedang' &&
        pHCondition == 'Netral') {
      return 'Baik';
    } else if ((turbidityCondition == 'Sedikit Keruh' &&
            temperatureCondition == 'Sedang' &&
            pHCondition == 'Netral') ||
        (turbidityCondition == 'Jernih' &&
            temperatureCondition == 'Hangat' &&
            pHCondition == 'Netral') ||
        (turbidityCondition == 'Jernih' &&
            temperatureCondition == 'Sedang' &&
            pHCondition == 'Basah')) {
      return 'Cukup Baik';
    } else if ((turbidityCondition == 'Sedikit Keruh' &&
            temperatureCondition == 'Hangat' &&
            pHCondition == 'Netral') ||
        (turbidityCondition == 'Sangat Jernih' &&
            temperatureCondition == 'Hangat' &&
            pHCondition == 'Basah') ||
        (turbidityCondition == 'Sedikit Keruh' &&
            temperatureCondition == 'Sedang' &&
            pHCondition == 'Basah') ||
        (turbidityCondition == 'Jernih' &&
            temperatureCondition == 'Hangat' &&
            pHCondition == 'Asam')) {
      return 'Kurang Baik';
    } else {
      return 'Tidak Baik';
    }
  }
}
