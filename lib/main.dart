import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/routes_name.dart';
import 'package:marble_master/routes/app_routes.dart';
import 'package:marble_master/views/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Liar Bar Game',
          initialRoute: RouteName.splashScreen,
          getPages: AppRoutes.appRoutes(),
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: AppColors.whiteColor,
            primaryColor: AppColors.primaryColor,
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.primaryColor,
                selectionColor: AppColors.primaryColor.withOpacity(0.5),
                selectionHandleColor: AppColors.primaryColor),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
