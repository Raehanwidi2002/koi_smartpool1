import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../../../controllers/fuzzy_logic_controller.dart';

class NotifikasiController extends GetxController {
  final FuzzyLogicController fuzzyController = Get.put(FuzzyLogicController());
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  RxBool kondisiKolamBaik = RxBool(true);

  final count = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Mendapatkan kondisi kolam saat inisialisasi
    getKondisiKolam();

    // Set up periodic timer to refresh the condition
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      getKondisiKolam();
    });
  }

  @override
  void onClose() {
    super.onClose();
    // Cancel the periodic timer when the controller is closed
    _timer?.cancel();
  }

  void getKondisiKolam() async {
    String kondisi = await fuzzyController.determineCondition();
    updateKondisiKolam(kondisi);
    print("kondisi");
    print(kondisi);
  }

  void updateKondisiKolam(String kondisi) {
    if (kondisi == 'Sangat Baik' ||
        kondisi == 'Cukup Baik' ||
        kondisi == 'Baik') {
      kondisiKolamBaik.value = true;
    } else {
      kondisiKolamBaik.value = false;
      showNotification();
    }
  }

  Future<void> showNotification() async {
    // Implement your notification logic here
    // Example:
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '01223', // Ganti dengan ID saluran notifikasi yang unik
      'SmartPool', // Ganti dengan nama saluran notifikasi yang diinginkan
      icon: "ic_notification",
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      123, // Ganti dengan ID notifikasi yang unik
      'Koi SmartPool', // Ganti dengan judul notifikasi yang diinginkan
      'Kondisi Kolam Sedang Tidak Baik', // Ganti dengan isi notifikasi yang diinginkan
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void increment() => count.value++;
}
