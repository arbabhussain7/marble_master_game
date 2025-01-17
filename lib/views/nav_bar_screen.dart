import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/controllers/nav_bar_controller.dart';

class NavBarScreen extends StatelessWidget {
  NavBarScreen({super.key});

  final NavbarController controller = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.widgetList[controller.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() => Container(
            decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                border: Border(
                    top:
                        BorderSide(color: AppColors.primaryColor, width: 4.w))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => controller.isSelectedIndex(2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 2
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        border: Border(
                            left: BorderSide(
                                color: AppColors.primaryColor, width: 2.w),
                            right: BorderSide(
                                color: AppColors.primaryColor, width: 2.w))),
                    width: 85.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        Image.asset(
                          ImageAssets.collectionImg,
                          width: 40.w,
                          height: 40.h,
                          color: controller.selectedIndex.value == 2
                              ? AppColors.whiteColor
                              : AppColors.brownColor,
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.isSelectedIndex(1),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 1
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        border: Border(
                          right: BorderSide(
                              color: AppColors.primaryColor, width: 2.w),
                        )),
                    width: 85.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        Image.asset(
                          ImageAssets.leaderBoardImg,
                          width: 40.w,
                          height: 40.h,
                          color: controller.selectedIndex.value == 1
                              ? AppColors.whiteColor
                              : AppColors.brownColor,
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.isSelectedIndex(0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 0
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        border: Border(
                            right: BorderSide(
                                color: AppColors.primaryColor, width: 2.w))),
                    width: 85.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        Image.asset(
                          ImageAssets.homeImg,
                          width: 40.w,
                          height: 40.h,
                          color: controller.selectedIndex.value == 0
                              ? AppColors.whiteColor
                              : AppColors.brownColor,
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.isSelectedIndex(3),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 3
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        border: Border(
                            right: BorderSide(
                                color: AppColors.primaryColor, width: 2.w))),
                    width: 85.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        Image.asset(
                          ImageAssets.rewardImg,
                          width: 40.w,
                          height: 40.h,
                          color: controller.selectedIndex.value == 3
                              ? AppColors.whiteColor
                              : AppColors.brownColor,
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.isSelectedIndex(4),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 4
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        border: Border(
                            right: BorderSide(
                                color: AppColors.primaryColor, width: 2.w))),
                    width: 85.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        Image.asset(
                          ImageAssets.settingImg,
                          width: 40.w,
                          height: 40.h,
                          color: controller.selectedIndex.value == 4
                              ? AppColors.whiteColor
                              : AppColors.brownColor,
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
