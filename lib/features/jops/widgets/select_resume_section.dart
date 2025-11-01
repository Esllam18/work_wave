import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/jops/widgets/resume_card.dart';

class SelectResumeSection extends StatefulWidget {
  const SelectResumeSection({super.key});

  @override
  State<SelectResumeSection> createState() => _SelectResumeSectionState();
}

class _SelectResumeSectionState extends State<SelectResumeSection> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: 'Select a resume',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(16.h),
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ResumeOptionCard(
              title: 'UX Designer',
              name: 'Haley Jessica',
              color: AppColors.primary,
              isSelected: selectedIndex == 0,
              onTap: () {
                setState(() => selectedIndex = 0);
              },
            ),
            ResumeOptionCard(
              title: 'Product Designer',
              name: 'Haley Jessica',
              color: Colors.redAccent,
              isSelected: selectedIndex == 1,
              onTap: () {
                setState(() => selectedIndex = 1);
              },
            ),
          ],
        ),
      ],
    );
  }
}
