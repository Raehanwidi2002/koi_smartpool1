import 'package:get/get.dart';

import '../controllers/kuras_kolam_controller.dart';

class KurasKolamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KurasKolamController>(
      () => KurasKolamController(),
    );
  }
}
