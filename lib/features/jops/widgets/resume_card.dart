import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_durations.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class ResumeOptionCard extends StatelessWidget {
  final String title;
  final String name;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const ResumeOptionCard({
    super.key,
    required this.title,
    required this.name,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppDurations.short,

        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Row(
          spacing: 5,
          children: [
            Center(
              child: Icon(
                isSelected
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked,
                color: isSelected ? color : Colors.grey,
                size: 18.sp,
              ),
            ),

            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: color.withOpacity(isSelected ? 1 : 0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CustomText(
                    txt: title,
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : color,
                    ),
                  ),
                ),

                // name
                Center(
                  child: CustomText(
                    txt: name,
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff1B1B1B),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
