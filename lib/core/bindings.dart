import 'package:creche/controllers/home_controller.dart';
import 'package:creche/controllers/profile_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(),
    );
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
