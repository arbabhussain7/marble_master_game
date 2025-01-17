import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/styles.dart';
import 'package:marble_master/controllers/settings_controller.dart';

class CustomRewardBox extends StatelessWidget {
  CustomRewardBox({
    super.key,
  });

  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 515.h,
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
                    'Cliam reward',
                    style: TextStyles.customDialogButtonText
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
            Image.asset(
              ImageAssets.rewardBoxImg,
              width: 240.w,
              height: 178.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 91.w),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssets.coinIcon),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    '2000',
                    style: TextStyles.appBarTextStyle
                        .copyWith(color: AppColors.whiteColor),
                  )
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
                        Border.all(color: AppColors.aMaxGreenColor, width: 3.w),
                    gradient: AppColors.claimButtonGrident,
                    borderRadius: BorderRadius.circular(9.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageAssets.rewardImgs,
                      width: 34.w,
                      height: 34.h,
                    ),
                    Text('Claim',
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
                    border:
                        Border.all(color: AppColors.primaryColor, width: 3.w),
                    gradient: AppColors.watchAdsButton,
                    borderRadius: BorderRadius.circular(9.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.watchAdsIcon,
                    ),
                    Text('Watch X2',
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
