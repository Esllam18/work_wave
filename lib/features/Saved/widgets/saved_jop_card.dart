import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Saved/models/jops_saved.dart';

class JobsSavedCard extends StatelessWidget {
  final JobsSavedModel item;
  final void Function()? onTap;
  const JobsSavedCard({super.key, required this.item, this.onTap});

  Color _getStatusColor() {
    switch (item.saveStatus.toLowerCase()) {
      case 'closed':
        return const Color(0xffFFEDED);
      case 'open':
        return const Color(0xffE8F9EF);
      case 'applied':
        return const Color(0xffEEF3FF);
      default:
        return Colors.white;
    }
  }

  Color _getStatusTextColor() {
    switch (item.saveStatus.toLowerCase()) {
      case 'closed':
        return const Color(0xffDC312D);
      case 'open':
        return const Color(0xff34A853);
      case 'applied':
        return const Color(0xff3366FF);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.white,
        // elevation: 2,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(item.image),
                  title: CustomText(
                    txt: item.title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  subtitle: CustomText(
                    txt: item.subTitle,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        txt: item.salary,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(6.h),
                      CustomText(
                        txt: item.location,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: CustomText(
                        txt: item.saveStatus,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: _getStatusTextColor(),
                      ),
                    ),
                    CustomText(
                      txt: item.jobStatus,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
