import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class ResumeContiner extends StatelessWidget {
  const ResumeContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 9.h),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CustomText(
                    txt: 'CV',
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),

                Column(
                  children: [
                    CustomText(
                      txt: 'Hannah Garcia',
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    CustomText(
                      txt: 'UX Designer',
                      style: GoogleFonts.poppins(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff95969D),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Color(0xff0C3067),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CustomText(
                    txt: 'pdf',
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomText(
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              txt:
                  'Creative UX Designer with 6+ years of experience in optimizing user experience through innovative solutions and dynamic interface designs. Successful in enhancing user engag-ement for well-known brands, providing a compelling user experience to improve brand loyalty and customer retention.  ',
              style: GoogleFonts.poppins(
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff95969D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
