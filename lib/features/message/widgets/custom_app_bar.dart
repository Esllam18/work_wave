import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Row(
        children: [
          CustomText(
            txt: 'Messages',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          Icon(
            CupertinoIcons.search,
            size: 28.sp,
            color: const Color(0xff356899),
          ),
          Gap(10.w),
          Image.asset(AppIcons.editSquare, width: 28.w, height: 28.h),
        ],
      ),
    );
  }
}
