import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class SavedAppBar extends StatelessWidget {
  const SavedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios, color: AppColors.black),
        Spacer(),
        CustomText(
          txt: 'Saved',

          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Stack(
          children: [
            CircleAvatar(radius: 25, child: Image.asset(AppImages.ellipse4)),
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 7.r,
                backgroundColor: Colors.white,

                child: CircleAvatar(radius: 4.r, backgroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
