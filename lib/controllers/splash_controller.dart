import 'package:get/get.dart';
import 'package:marble_master/constants/routes_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startLoading();
  }

  void _startLoading() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(RouteName.loaderScreen);
    });
  }
}
