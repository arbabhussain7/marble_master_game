import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/styles.dart';
import 'package:marble_master/widgets/custom_progress_bar.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final String hitBallsCount;
  final String coinCount;
  final String progressText;
  final double progressValue;
  final VoidCallback onTap;
  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.hitBallsCount,
    required this.coinCount,
    required this.progressText,
    required this.progressValue,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 376.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 180.h,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    imagePath,
                    width: 100.w,
                    height: 100.h,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 104.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFBD14), Color(0xFFFFD824)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: AppColors.bBrownColor,
                    width: 4,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(hitBallsCount,
                        style: TextStyles.collectionTextStye
                            .copyWith(color: AppColors.whiteColor)),
                    Text('Hit balls',
                        style: TextStyles.coinTextStyle
                            .copyWith(color: AppColors.whiteColor)),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(ImageAssets.coinIcon),
                      Text(coinCount,
                          style: TextStyles.collectionTextStye
                              .copyWith(color: AppColors.primaryColor)),
                      SizedBox(
                        width: 55.w,
                      ),
                      Text(
                        progressText,
                        style: TextStyles.leaderBoardTextStyle
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 281.w,
                    child: CustomProgressBar(progress: 0.7),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
