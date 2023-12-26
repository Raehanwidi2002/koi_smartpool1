import 'package:get/get.dart';

class FuzzyLogicController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    turbidityB = 26; // Nilai kekeruhan air saat ini
    temperatureB = 30; // Nilai suhu air saat ini
    pHB = 8; // Nilai pH air saat ini
    conditionB = determineCondition();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  late double turbidityB;
  late double temperatureB;
  late double pHB;
  late String conditionB;

  var txt;

  // Method yang digunakan untuk menentukan kondisi kolam
  String determineCondition() {
    // Menentukan kondisi kekeruhan air
    String turbidityCondition;
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
    String temperatureCondition;
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
    String pHCondition;
    if (pHB < 6.5) {
      pHCondition = 'Asam';
    } else if (pHB >= 6.5 && pHB <= 7.5) {
      pHCondition = 'Netral';
    } else {
      pHCondition = 'Basah';
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
