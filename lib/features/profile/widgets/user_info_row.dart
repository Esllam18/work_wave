import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/profile/data/data_source.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(userInfoList.length, (index) {
        final item = userInfoList[index];
        return Column(
          children: [
            CustomText(
              txt: "${item.number}",
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 6.h),
            CustomText(
              txt: item.text,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff95969D),
              ),
            ),
          ],
        );
      }),
    );
  }
}
