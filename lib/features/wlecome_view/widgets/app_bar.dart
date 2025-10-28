import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class WelcomeAppBar extends StatelessWidget {
  const WelcomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      title: Padding(
        padding: EdgeInsets.only(top: 30.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              txt: 'Continue as a guest',
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
                size: 30.sp,
              ),
            ),
          ],
        ),
      ),
      centerTitle: false,

      // cancel leading
      automaticallyImplyLeading: false,
    );
  }
}
