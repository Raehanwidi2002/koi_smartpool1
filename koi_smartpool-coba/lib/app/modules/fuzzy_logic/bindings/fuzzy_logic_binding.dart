import 'package:get/get.dart';

import '../controllers/fuzzy_logic_controller.dart';

class FuzzyLogicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FuzzyLogicController>(
      () => FuzzyLogicController(),
    );
  }
}
