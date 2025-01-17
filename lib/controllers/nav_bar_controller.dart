import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marble_master/views/collection_screen.dart';
import 'package:marble_master/views/home_screen.dart';
import 'package:marble_master/views/leader_board_screen.dart';
import 'package:marble_master/views/reward_screen.dart';
import 'package:marble_master/views/setting_screen.dart';

class NavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> widgetList = [
    HomeScreen(),
    LeaderBoardScreen(),
    CollectionScreen(),
    RewardsScreen(),
    SettingScreen()
  ];
  void isSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
