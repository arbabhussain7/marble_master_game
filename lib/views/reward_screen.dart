import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/list.dart';
import 'package:marble_master/constants/routes_name.dart';
import 'package:marble_master/constants/styles.dart';
import 'package:marble_master/widgets/custom_app_bar.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.screenBgImg),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(text: 'Rewards'),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: rewards.length,
                  itemBuilder: (context, index) {
                    final reward = rewards[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
                      decoration: BoxDecoration(
                        color: AppColors.bBrownColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(7.r),
                                border: Border.all(
                                  color: AppColors.bBrownColor,
                                  width: 2.w,
                                ),
                              ),
                              child: RichText(
                                text: TextSpan(
                                    text: ' ${reward['day']}',
                                    style: TextStyles.rewardTextStyle
                                        .copyWith(color: AppColors.whiteColor),
                                    children: [
                                      TextSpan(
                                        text: '\nDay',
                                        style: TextStyles.leaderBoardTextStyle
                                            .copyWith(
                                                color: AppColors.whiteColor),
                                      )
                                    ]),
                              )),
                          SizedBox(width: 12.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.bBrownColor,
                                width: 4.w,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(ImageAssets.coinIcon),
                                const SizedBox(width: 4),
                                Text(
                                  '${reward['coins']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: reward['isCollected']
                                ? null
                                : () {
                                    Get.toNamed(RouteName.collectionScreen);
                                    print(
                                        'Collected reward for day ${reward['day']}');
                                  },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF9EEF46),
                                    Color(0xFF4DD02B)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.blackColor.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  reward['isCollected']
                                      ? 'Collected'
                                      : 'Collect',
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
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12.h,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
