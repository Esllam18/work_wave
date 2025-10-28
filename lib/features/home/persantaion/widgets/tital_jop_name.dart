import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class TitalCollactionName extends StatelessWidget {
  const TitalCollactionName({super.key, required this.titalJop});

  final String titalJop;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          txt: titalJop,

          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        CustomText(
          txt: 'See all',

          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.accent,
        ),
      ],
    );
  }
}
