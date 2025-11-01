import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/jops/widgets/profile_card.dart';
import 'package:work_wave/features/jops/widgets/select_resume_section.dart';

class SelectProfileSection extends StatefulWidget {
  const SelectProfileSection({super.key});

  @override
  State<SelectProfileSection> createState() => _SelectProfileWidgetState();
}

class _SelectProfileWidgetState extends State<SelectProfileSection> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            txt: 'Select a profile',
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: ProfileCard(
                  isSelected: selectedIndex == 0,
                  name: 'Haley Jessica',
                  job: 'UX Designer',
                  image: AppImages.maskgroup,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: ProfileCard(
                  isSelected: selectedIndex == 1,
                  name: 'Haley Jessica',
                  job: 'Product Designer',
                  image: AppImages.maskgroup2,
                ),
              ),
            ],
          ),
          Gap(32.h),

          SelectResumeSection(),
        ],
      ),
    );
  }
}
