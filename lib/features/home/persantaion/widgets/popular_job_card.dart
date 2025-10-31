import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class PopularJobsListView extends StatelessWidget {
  const PopularJobsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularJobCard(
          tital: 'Jr Executive',
          salery: r'$96,000/y',
          secondTriling: 'Los Angels, US',
          subTital: 'Burger King',
          image: AppImages.burgerKing,
        ),
        Gap(12.h),
        PopularJobCard(
          tital: 'Product Manager',
          salery: r'$84,000/y',
          secondTriling: 'Florida, US',
          subTital: 'Beats',
          image: AppImages.beats,
        ),
      ],
    );
  }
}

class PopularJobCard extends StatelessWidget {
  const PopularJobCard({
    super.key,
    required this.tital,
    required this.subTital,
    required this.salery,
    required this.image,
    required this.secondTriling,
  });
  final String tital;
  final String subTital;
  final String salery;
  final String image;
  final String secondTriling;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16.r),
      ),
      contentPadding: EdgeInsets.all(12),
      leading: Image.asset(image),
      title: CustomText(
        txt: tital,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      subtitle: CustomText(
        txt: subTital,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText(txt: salery, fontSize: 12.sp, fontWeight: FontWeight.w500),
          Gap(8.h),
          CustomText(
            txt: secondTriling,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
