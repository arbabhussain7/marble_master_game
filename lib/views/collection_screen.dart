import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/widgets/custom_app_bar.dart';
import 'package:marble_master/widgets/custom_collection_bar.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.screenBgImg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(text: 'Collection'),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: CustomCard(
                    imagePath: 'assets/images/one-image.png',
                    buttonText: 'Pending',
                    hitBallsCount: '100',
                    coinCount: '100050',
                    progressText: '50/100',
                    progressValue: 75,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: CustomCard(
                    imagePath: 'assets/images/two-image.png',
                    buttonText: 'Pending',
                    hitBallsCount: '100',
                    coinCount: '100050',
                    progressText: '50/100',
                    progressValue: 75,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: CustomCard(
                    imagePath: 'assets/images/two-image.png',
                    buttonText: 'Pending',
                    hitBallsCount: '100',
                    coinCount: '100050',
                    progressText: '50/100',
                    progressValue: 75,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: CustomCard(
                    imagePath: 'assets/images/two-image.png',
                    buttonText: 'Pending',
                    hitBallsCount: '100',
                    coinCount: '100050',
                    progressText: '50/100',
                    progressValue: 75,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: CustomCard(
                    imagePath: 'assets/images/two-image.png',
                    buttonText: 'Pending',
                    hitBallsCount: '100',
                    coinCount: '100050',
                    progressText: '50/100',
                    progressValue: 75,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
