import 'package:get/get.dart';

import '../controllers/kekeruhan_air_controller.dart';

class KekeruhanAirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KekeruhanAirController>(
      () => KekeruhanAirController(),
    );
  }
}
