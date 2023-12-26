import 'package:get/get.dart';

import '../controllers/p_h_air_controller.dart';

class PHAirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PHAirController>(
      () => PHAirController(),
    );
  }
}
