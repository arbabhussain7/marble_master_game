import 'package:get/get.dart';
import 'package:marble_master/constants/routes_name.dart';

class LoaderController extends GetxController {
  var progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    startLoading();
  }

  void startLoading() {
    Future.delayed(Duration(milliseconds: 700), () {
      if (progress.value < 1.0) {
        progress.value += 0.1;
        startLoading();
      } else {
        Get.offAllNamed(RouteName.navBarScreen);
      }
    });
  }
}
