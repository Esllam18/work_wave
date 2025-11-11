import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Search/data/models/search_item_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.filteredJobs});

  final List<SearchItemModel> filteredJobs;

  @override
  Widget build(BuildContext context) {
    if (filteredJobs.isEmpty) {
      return Expanded(
        child: Center(
          child: CustomText(
            txt: "No jobs found",
            fontSize: 14.sp,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: filteredJobs.length,
        separatorBuilder: (context, index) =>
            Divider(height: 20.h, color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          final item = filteredJobs[index];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                item.image,
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
            title: CustomText(
              txt: item.title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            subtitle: CustomText(
              txt: item.subTitle,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
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
          );
        },
      ),
    );
  }
}
