import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Saved/widgets/filter_chips.dart';
import 'package:work_wave/features/Saved/widgets/jobs_saved_card_list_view.dart';
import 'package:work_wave/features/Saved/widgets/saved_app_bar.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.h),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SavedAppBar(),
              Gap(34.h),
              CustomText(
                txt: 'You saved 48 Jobs 👍',
                color: AppColors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
              Gap(36.h),
              const FilterChips(),
              Gap(36.h),
              JobsSavedCardListView(),
            ],
          ),
        ),
      ),
    );
  }
}
