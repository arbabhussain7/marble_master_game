// Settings Controller
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isSwitchedSound = false.obs;
  var isSwitchedMusic = false.obs;
  var isSwitchedVibration = false.obs;

  void toggleSwitchSound() {
    isSwitchedSound.value = !isSwitchedSound.value;
  }

  void toggleSwitchMusic() {
    isSwitchedMusic.value = !isSwitchedMusic.value;
  }

  void toggleSwitchVibration() {
    isSwitchedVibration.value = !isSwitchedVibration.value;
  }
}
