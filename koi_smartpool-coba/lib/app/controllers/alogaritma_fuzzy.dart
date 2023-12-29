import 'package:flutter/material.dart';

class FuzzyLogic extends State {
  late double _turbidity;
  late double _temperature;
  late double _pH;
  late String _condition;

  var txt;

  @override
  void initState() {
    super.initState();

    _turbidity = 26; // Nilai kekeruhan air saat ini
    _temperature = 30; // Nilai suhu air saat ini
    _pH = 8; // Nilai pH air saat ini
  }

  // Method yang digunakan untuk menentukan kondisi kolam
  String determineCondition() {
    // Menentukan kondisi kekeruhan air
    String turbidityCondition;
    if (_turbidity <= 10) {
      turbidityCondition = 'Sangat Jernih';
    } else if (_turbidity > 10 && _turbidity <= 25) {
      turbidityCondition = 'Jernih';
    } else if (_turbidity > 25 && _turbidity <= 50) {
      turbidityCondition = 'Sedikit Keruh';
    } else if (_turbidity > 50 && _turbidity <= 75) {
      turbidityCondition = 'Keruh';
    } else {
      turbidityCondition = 'Sangat Keruh';
    }

    // Menentukan kondisi suhu air
    String temperatureCondition;
    if (_temperature <= 20) {
      temperatureCondition = 'Dingin';
    } else if (_temperature > 20.0 && _temperature <= 25.0) {
      temperatureCondition = 'Sedang';
    } else if (_temperature > 25.0 && _temperature <= 30.0) {
      temperatureCondition = 'Hangat';
    } else if (_temperature > 30.0 && _temperature <= 35.0) {
      temperatureCondition = 'Panas';
    } else {
      temperatureCondition = 'Sangat Panas';
    }
// Menentukan kondisi pH air
    String pHCondition;
    if (_pH < 6.5) {
      pHCondition = 'Asam';
    } else if (_pH >= 6.5 && _pH <= 7.5) {
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

  @override
  Widget build(BuildContext context) {
// Menentukan kondisi kolam saat ini
    _condition = determineCondition();

    return Scaffold(
      body: Center(
        child: Text('Kondisi kolam saat ini: $_condition'),
      ),
    );
  }
}
