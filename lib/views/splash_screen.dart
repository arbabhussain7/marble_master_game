import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.bgImg), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: AppColors.blackColor.withOpacity(0.4),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 182.h,
            ),
            Center(
              child: SvgPicture.asset(
                ImageAssets.logoIcon,
                width: 324.w,
                height: 194.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
