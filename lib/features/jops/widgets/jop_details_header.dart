import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class JopDetailsHeader extends StatelessWidget {
  const JopDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dec = ['Design', 'Full-Time', 'Junior'];
    return Stack(
      children: [
        Positioned(
          left: 15,
          top: 15,
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        Positioned(right: 15, top: 15, child: Icon(Icons.bookmark_add_rounded)),
        Positioned(
          left: 0,
          right: 0,
          top: 30.h,
          child: Column(
            children: [
              Image.asset(AppImages.beats),
              Gap(20.h),
              CustomText(
                txt: 'Product Manager',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              Gap(10.h),
              CustomText(
                txt: 'Beats',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 28,
                children: List.generate(dec.length, (index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 26.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(52.r),
                      color: AppColors.secondary,
                    ),
                    child: CustomText(
                      txt: dec[index],
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }),
              ),
              Gap(28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    txt: r'$180,00/year',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  CustomText(
                    txt: r'Seattle, USA',

                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
