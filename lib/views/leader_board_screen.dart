import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/list.dart';
import 'package:marble_master/constants/styles.dart';
import 'package:marble_master/controllers/leader_board_controller.dart';
import 'package:marble_master/widgets/custom_app_bar.dart';

class LeaderBoardScreen extends StatelessWidget {
  LeaderBoardScreen({super.key});
  final LeaderboardController controller = Get.put(LeaderboardController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.screenBgImg), fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              text: 'Leaderboard',
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 43.w),
              margin: EdgeInsets.symmetric(horizontal: 13.w),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SizedBox(
                width: 561.w,
                height: 51.h,
                child: ListView.separated(
                  itemCount: listOfLeaderboard.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool isSelected = controller.selectedIndex.value == index;

                      return GestureDetector(
                        onTap: () {
                          controller.updateSelectedIndex(index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 43.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            gradient: isSelected
                                ? AppColors.leaderBoardGridentTwo
                                : AppColors.leaderBoardGrident,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.whiteColor
                                  : AppColors.secondaryColor,
                              width: 2.w,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              listOfLeaderboard[index],
                              style: TextStyles.leaderBoardTextStyle.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.w);
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Obx(() {
              if (controller.selectedIndex.value == 0) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: listOfWorldUserName.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  border: Border.all(
                                      color: AppColors.bBrownColor, width: 2.w),
                                  borderRadius: BorderRadius.circular(4.r)),
                              child: Text(
                                listOfNumber[index],
                                style: TextStyles.appBarTextStyle
                                    .copyWith(color: AppColors.whiteColor),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              listOfWorldUserName[index],
                              style: TextStyles.leaderBoardTextStyle
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: AppColors.primaryColor,
                                  border:
                                      Border.all(color: AppColors.bBrownColor)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(ImageAssets.coinIcon),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                    listOfWorldUserCoin[index],
                                    style: TextStyles.leaderBoardWordTextStyle
                                        .copyWith(color: AppColors.whiteColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8.h,
                      );
                    },
                  ),
                );
              } else if (controller.selectedIndex.value == 1) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: listOfWorldUserName.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  border: Border.all(
                                      color: AppColors.bBrownColor, width: 2.w),
                                  borderRadius: BorderRadius.circular(4.r)),
                              child: Text(
                                listOfNumber[index],
                                style: TextStyles.appBarTextStyle
                                    .copyWith(color: AppColors.whiteColor),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              listOfFriendUserName[index],
                              style: TextStyles.leaderBoardTextStyle
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: AppColors.primaryColor,
                                  border:
                                      Border.all(color: AppColors.bBrownColor)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(ImageAssets.coinIcon),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                    listOfFrienddUserCoin[index],
                                    style: TextStyles.leaderBoardWordTextStyle
                                        .copyWith(color: AppColors.whiteColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8.h,
                      );
                    },
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
