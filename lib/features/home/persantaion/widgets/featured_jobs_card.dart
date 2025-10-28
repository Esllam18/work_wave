import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class FeaturedJobsListView extends StatelessWidget {
  const FeaturedJobsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FeaturedJobsCard(
          tital: 'Jr Executive',
          salery: r'$96,000/y',
          subTital: 'Pinterest',
          image: AppImages.pentest,
        ),
        FeaturedJobsCard(
          image: AppImages.spotify,
          tital: 'Sr Developer',
          salery: r'$115,000/y',
          subTital: 'Spotify',
        ),
      ],
    );
  }
}

class FeaturedJobsCard extends StatelessWidget {
  const FeaturedJobsCard({
    super.key,
    required this.tital,
    required this.subTital,
    required this.salery,
    required this.image,
  });

  final String tital;
  final String subTital;
  final String salery;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(image, width: 56.w, height: 56.h),
                Gap(4.h),
                CustomText(
                  txt: tital,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
                Gap(4.h),
                CustomText(
                  txt: subTital,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
                Gap(4.h),
                CustomText(
                  txt: salery,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
