import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  final NotifikasiController notifikasiController =
      Get.put(NotifikasiController());
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (notifikasiController.kondisiKolamBaik.value) {
              return Text(
                'Tidak ada notifikasi',
                style: TextStyle(fontSize: 20),
              );
            } else {
              notifikasiController.showNotification();
              return Text(
                'Kondisi kolam tidak baik. Notifikasi telah dikirim.',
                style: TextStyle(fontSize: 20),
              );
            }
          },
        ),
      ),
    );
  }
}
