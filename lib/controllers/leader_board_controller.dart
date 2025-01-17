import 'package:get/get.dart';

class LeaderboardController extends GetxController {
  var selectedIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
