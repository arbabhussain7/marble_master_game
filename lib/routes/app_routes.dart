import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:marble_master/constants/routes_name.dart';
import 'package:marble_master/views/collection_screen.dart';
import 'package:marble_master/views/home_screen.dart';
import 'package:marble_master/views/leader_board_screen.dart';
import 'package:marble_master/views/loader_screen.dart';
import 'package:marble_master/views/nav_bar_screen.dart';
import 'package:marble_master/views/play_game_screen.dart';
import 'package:marble_master/views/reward_screen.dart';
import 'package:marble_master/views/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => SplashScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.loaderScreen,
            page: () => LoaderScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.homeScreen,
            page: () => const HomeScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.leaderBoardScreen,
            page: () => LeaderBoardScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.rewardScreen,
            page: () => const RewardsScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.collectionScreen,
            page: () => const CollectionScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.navBarScreen,
            page: () => NavBarScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.playGameScreen,
            page: () => PlayGameScreen(),
            transition: Transition.rightToLeft),
      ];
}
