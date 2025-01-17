import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/controllers/loader_controller.dart';

class LoaderScreen extends StatelessWidget {
  LoaderScreen({super.key});
  final controller = Get.put(LoaderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.bgImg), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: AppColors.blackColor.withOpacity(0.4),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Loading...',
                style: GoogleFonts.rubik(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor),
              ),
              SizedBox(height: 30.h),
              Obx(() => Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.whiteColor, width: 2.w),
                        borderRadius: BorderRadius.circular(22.r)),
                    width: 316.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.r),
                      child: LinearProgressIndicator(
                        value: controller.progress.value,
                        backgroundColor: AppColors.primaryColor,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.maxGreenColor),
                        minHeight: 15,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
