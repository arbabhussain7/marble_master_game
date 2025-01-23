import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/routes_name.dart';
import 'package:marble_master/constants/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withOpacity(0.9),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.homeBgImg), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 42.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.r),
                          bottomRight: Radius.circular(12.r)),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(ImageAssets.coinIcon),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '120',
                          style: TextStyles.coinTextStyle
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Container(
                          width: 28.w,
                          height: 26.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                  ])),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.secondaryColor, width: 2.w),
                          borderRadius: BorderRadius.circular(12.r),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryColor,
                                AppColors.secondaryColor,
                              ])),
                      child: Image.asset(
                        ImageAssets.userImg,
                        width: 35.w,
                        height: 35.h,
                        color: AppColors.whiteColor,
                      )),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.gameScreen);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 58.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.whiteColor, width: 3.w),
                      gradient: AppColors.buttonGradient,
                      borderRadius: BorderRadius.circular(9.r)),
                  child: Text('PLAY',
                      style: TextStyles.buttonTextStyle
                          .copyWith(color: AppColors.whiteColor)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
