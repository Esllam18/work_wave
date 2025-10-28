import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/wlecome_view/widgets/app_bar.dart';
import 'package:work_wave/features/wlecome_view/widgets/the_tow_btn.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: WelcomeAppBar(),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32.h),
              Image.asset(
                AppImages.welcome,
                width: 278.w,
                height: 301.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomText(
                  txt: 'Discover Your Dream Job here',
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 22.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomText(
                  txt:
                      'Explore all the existing job roles based on your interest and study major',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              Gap(50.h),
              TheTowBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
