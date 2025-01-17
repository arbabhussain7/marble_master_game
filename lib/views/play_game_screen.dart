import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/styles.dart';
import 'package:marble_master/controllers/settings_controller.dart';
import 'package:marble_master/widgets/custom_dialog_box.dart';
import 'package:marble_master/widgets/custom_reward_box.dart';

class PlayGameScreen extends StatelessWidget {
  PlayGameScreen({super.key});
  final SettingsController controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.playGameBgImg),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.primaryColor, width: 8.w)),
                        color: AppColors.secondaryColor,
                        image: const DecorationImage(
                            image: AssetImage(
                          ImageAssets.appBarImg,
                        ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.dialog(CustomDialogBox());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.h),
                            decoration: BoxDecoration(
                                gradient: AppColors.buttonGradient,
                                borderRadius: BorderRadius.circular(4.r)),
                            child: SvgPicture.asset(
                              ImageAssets.pauseIcon,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(CustomRewardBox());
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.r)),
                                width: 86.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22.r),
                                  child: const LinearProgressIndicator(
                                    value: 0.7,
                                    backgroundColor: AppColors.cBrownColor,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.maxYellowColor),
                                    minHeight: 7,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ImageAssets.coinIcon),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    '2000',
                                    style: TextStyles.leaderBoardTextStyle
                                        .copyWith(
                                            color: AppColors.primaryColor),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.3),
                              offset: const Offset(-7, 0),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.3),
                              offset: const Offset(7, 0),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                          color: AppColors.secondaryColor,
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.primaryColor, width: 8.w)),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.circular(12.r))),
                      padding:
                          EdgeInsets.symmetric(vertical: 7.h, horizontal: 17.w),
                      child: Column(
                        children: [
                          Text(
                            '50',
                            style: TextStyles.buttonTextStyle
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.r)),
                            width: 106.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22.r),
                              child: const LinearProgressIndicator(
                                value: 0.5,
                                backgroundColor: AppColors.cBrownColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.maxYellowColor),
                                minHeight: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
