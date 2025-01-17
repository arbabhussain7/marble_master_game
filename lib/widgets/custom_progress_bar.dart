import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marble_master/constants/colors.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;
  const CustomProgressBar({
    super.key,
    required this.progress,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(color: AppColors.bBrownColor, width: 4.w)),
      width: 86.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.r),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.bBrownColor,
          valueColor:
              const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          minHeight: 16,
        ),
      ),
    );
  }
}
