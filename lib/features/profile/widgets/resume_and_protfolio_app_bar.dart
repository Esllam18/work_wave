import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class ResumeAndProtfolioAppBar extends StatelessWidget {
  const ResumeAndProtfolioAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      title: CustomText(
        txt: 'Resume & Portfolio',
        color: AppColors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
      backgroundColor: Color(0xffFAFAFD),
      surfaceTintColor: Color(0xffFAFAFD),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: TextButton(
            onPressed: () {},
            child: CustomText(
              txt: 'Skip',
              color: AppColors.primary,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
