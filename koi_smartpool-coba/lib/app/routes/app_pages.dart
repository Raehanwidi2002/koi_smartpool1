import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kekeruhan_air/bindings/kekeruhan_air_binding.dart';
import '../modules/kekeruhan_air/views/kekeruhan_air_view.dart';
import '../modules/kuras_kolam/bindings/kuras_kolam_binding.dart';
import '../modules/kuras_kolam/views/kuras_kolam_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/pH_air/bindings/p_h_air_binding.dart';
import '../modules/pH_air/views/p_h_air_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/temperatur_air/bindings/temperatur_air_binding.dart';
import '../modules/temperatur_air/views/temperatur_air_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.TEMPERATUR_AIR,
      page: () => TemperaturAirView(),
      binding: TemperaturAirBinding(),
    ),
    GetPage(
      name: _Paths.KEKERUHAN_AIR,
      page: () => KekeruhanAirView(),
      binding: KekeruhanAirBinding(),
    ),
    GetPage(
      name: _Paths.P_H_AIR,
      page: () => PHAirView(),
      binding: PHAirBinding(),
    ),
    GetPage(
      name: _Paths.KURAS_KOLAM,
      page: () => KurasKolamView(),
      binding: KurasKolamBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
  ];
}
