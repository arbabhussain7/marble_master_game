import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/styles.dart';
import 'package:marble_master/controllers/settings_controller.dart';
import 'package:marble_master/widgets/custom_app_bar.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final SettingsController controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.screenBgImg), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(text: 'Settings'),
              SizedBox(
                height: 22.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22.w),
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 51.h),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    border: Border.all(color: AppColors.bBrownColor),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: SvgPicture.asset(ImageAssets.soundIcon),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Sound',
                          style: TextStyles.settingsTextStyle
                              .copyWith(color: AppColors.primaryColor),
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
                                        gradient: controller
                                                .isSwitchedSound.value
                                            ? AppColors.buttonGradient
                                            : AppColors.leaderBoardGridentTwo,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
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
                    SizedBox(
                      height: 22.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: SvgPicture.asset(ImageAssets.musicIcon),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Music',
                          style: TextStyles.settingsTextStyle
                              .copyWith(color: AppColors.primaryColor),
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
                                        gradient: controller
                                                .isSwitchedMusic.value
                                            ? AppColors.buttonGradient
                                            : AppColors.leaderBoardGridentTwo,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
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
                    SizedBox(
                      height: 22.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: SvgPicture.asset(ImageAssets.vibrationIcon),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Vibration',
                          style: TextStyles.settingsTextStyle
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            controller.toggleSwitchVibration();
                          },
                          child: Obx(
                            () => Container(
                              width: 70.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: controller.isSwitchedVibration.value
                                    ? AppColors.primaryColor
                                    : AppColors.maxGreenColor,
                                border: Border.all(
                                  color: AppColors.whiteColor,
                                  width: 2.w,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Stack(
                                alignment: controller.isSwitchedVibration.value
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        gradient: controller
                                                .isSwitchedVibration.value
                                            ? AppColors.buttonGradient
                                            : AppColors.leaderBoardGridentTwo,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
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
                  ],
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              //
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22.w),
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 31.h),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    border: Border.all(color: AppColors.bBrownColor),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: SvgPicture.asset(ImageAssets.ruleIcon),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Rules',
                          style: TextStyles.settingsTextStyle
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: SvgPicture.asset(ImageAssets.policyIcon),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Policy',
                          style: TextStyles.settingsTextStyle
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: SvgPicture.asset(ImageAssets.supportIcon),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Support',
                          style: TextStyles.settingsTextStyle
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
