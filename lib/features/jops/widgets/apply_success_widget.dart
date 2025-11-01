import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class ApplySuccessView extends StatelessWidget {
  const ApplySuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplySuccessWidget(
      imagePath: AppImages.successIllustration,
      title: "Successful",
      subtitle: "You’ve successfully applied to Spotify UX Intern role.",
      buttonText: "Browse Jobs",
      onPressed: () {
        GoRouter.of(context).push(RouteNames.root);
      },
    );
  }
}

class ApplySuccessWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;

  const ApplySuccessWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Illustration
              Image.asset(imagePath, width: 250.w, height: 250.h),
              Gap(40.h),
              CustomText(
                txt: title,
                style: GoogleFonts.poppins(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Gap(12.h),
              CustomText(
                txt: subtitle,
                textAlign: TextAlign.center,
                maxLines: 6,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,

                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
              Gap(40.h),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onPressed,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: const Color(0xff356899)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff356899),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
