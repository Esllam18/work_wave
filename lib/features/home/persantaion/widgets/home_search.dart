import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/widgets/custom_text_form_field.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(RouteNames.search),

      child: Row(
        children: [
          Expanded(
            child: CustomTextormField(
              onTap: () => GoRouter.of(context).push(RouteNames.search),
              hint: 'Search a job or position',
              prefixIcon: CupertinoIcons.search,
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(AppIcons.filter, width: 22.w, height: 25.h),
            ),
          ),
        ],
      ),
    );
  }
}
