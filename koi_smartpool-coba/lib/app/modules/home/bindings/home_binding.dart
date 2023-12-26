import 'package:get/get.dart';
import 'package:koi_smartpool/app/controllers/fuzzy_logic_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FuzzyLogicController>(
      () => FuzzyLogicController(),
    );
  }
}
