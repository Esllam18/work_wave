import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/consts/app_durations.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class ProfileCard extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String job;
  final String image;

  const ProfileCard({
    super.key,
    required this.isSelected,
    required this.name,
    required this.job,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColors.primary.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 2,
            ),
        ],
      ),
      duration: AppDurations.short,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.check_circle_rounded,
              color: isSelected ? AppColors.primary : Colors.grey.shade300,
            ),
          ),
          Image.asset(image, width: 72.w, height: 72.h),
          CustomText(
            txt: name,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              CustomText(
                txt: job,
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff95969D),
                ),
              ),
              Image.asset(AppIcons.verified, width: 12.w, height: 12.h),
            ],
          ),
        ],
      ),
    );
  }
}
