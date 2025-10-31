import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class NotificationTitle extends StatelessWidget {
  const NotificationTitle({super.key, required this.notificationTitle});

  final String notificationTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          txt: notificationTitle,

          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        CustomText(
          txt: 'See all',

          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.accent,
        ),
      ],
    );
  }
}
