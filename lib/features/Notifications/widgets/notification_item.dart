import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    this.textSpan,
    this.orginalText,
    this.image,
    this.time,
    required this.isRead,
  });

  final String? textSpan;
  final String? orginalText;
  final String? image;
  final String? time;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ Company Logo
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              image ?? '',
              width: 40.w,
              height: 40.w,
              fit: BoxFit.cover,
            ),
          ),
          Gap(12.w),

          // 📝 Notification Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main text (Rich)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: textSpan ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black, // highlight brand/company
                        ),
                      ),
                      TextSpan(
                        text: orginalText ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black, // softer color for text
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(4.h),

                // Time + dot
                Row(
                  children: [
                    CustomText(
                      txt: time ?? '',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    Gap(6.w),
                    if (!isRead)
                      CircleAvatar(
                        radius: 4.r,
                        backgroundColor: AppColors.primary,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
