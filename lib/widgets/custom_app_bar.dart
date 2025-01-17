import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 6.h),
          decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              image: DecorationImage(
                  image: AssetImage(
                ImageAssets.appBarImg,
              ))),
          child: Center(
            child: Text(
              text,
              style: TextStyles.appBarTextStyle
                  .copyWith(color: AppColors.aBrownColor),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          decoration: const BoxDecoration(color: AppColors.aBrownColor),
        ),
      ],
    );
  }
}
