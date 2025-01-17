import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/styles.dart';
import 'package:marble_master/controllers/settings_controller.dart';

class CustomDialogBox extends StatelessWidget {
  CustomDialogBox({
    super.key,
  });

  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 415.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: AppColors.secondaryColor),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.r),
                      topRight: Radius.circular(18.r)),
                  color: AppColors.primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.transparent,
                  ),
                  Text(
                    'Pause',
                    style: TextStyles.collectionTextStye
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(ImageAssets.cancelIcon),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 33.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  SvgPicture.asset(ImageAssets.soundIcon),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    'Sound',
                    style: TextStyles.settingsTextStyle
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      controller.toggleSwitchSound();
                    },
                    child: Obx(
                      () => Container(
                        width: 70.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: controller.isSwitchedSound.value
                              ? AppColors.primaryColor
                              : AppColors.maxGreenColor,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Stack(
                          alignment: controller.isSwitchedSound.value
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 25.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  gradient: controller.isSwitchedSound.value
                                      ? AppColors.buttonGradient
                                      : AppColors.leaderBoardGridentTwo,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  SvgPicture.asset(ImageAssets.musicIcon),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    'Music',
                    style: TextStyles.settingsTextStyle
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      controller.toggleSwitchMusic();
                    },
                    child: Obx(
                      () => Container(
                        width: 70.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: controller.isSwitchedMusic.value
                              ? AppColors.primaryColor
                              : AppColors.maxGreenColor,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Stack(
                          alignment: controller.isSwitchedMusic.value
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 25.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  gradient: controller.isSwitchedMusic.value
                                      ? AppColors.buttonGradient
                                      : AppColors.leaderBoardGridentTwo,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 33.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.bBrownColor, width: 3.w),
                    gradient: AppColors.leaderBoardGrident,
                    borderRadius: BorderRadius.circular(9.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.continueIcon,
                    ),
                    Text('Continue',
                        style: TextStyles.customDialogButtonText
                            .copyWith(color: AppColors.whiteColor)),
                    const Icon(
                      Icons.abc,
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 33.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.aRedColor, width: 3.w),
                    gradient: AppColors.exitButtonGrident,
                    borderRadius: BorderRadius.circular(9.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.exitIcon,
                    ),
                    Text('Exit',
                        style: TextStyles.customDialogButtonText
                            .copyWith(color: AppColors.whiteColor)),
                    const Icon(
                      Icons.abc,
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
