import 'package:get/get.dart';

import '../controllers/temperatur_air_controller.dart';

class TemperaturAirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TemperaturAirController>(
      () => TemperaturAirController(),
    );
  }
}
