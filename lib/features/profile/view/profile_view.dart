import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/profile/widgets/Portfolio_and_see_all_line.dart';
import 'package:work_wave/features/profile/widgets/portfolio_contant.dart';
import 'package:work_wave/features/profile/widgets/profile_header.dart';
import 'package:work_wave/features/profile/widgets/resume_and_make_a_resume_line.dart';
import 'package:work_wave/features/profile/widgets/resume_continer.dart';
import 'package:work_wave/features/profile/widgets/user_info_row.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAFAFD),
          surfaceTintColor: Color(0xffFAFAFD),
          leading: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
              child: CustomText(
                txt: 'Edit',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey[70],
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xffFAFAFD),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ProfileHeader(),
                SizedBox(height: 40.h),
                UserInfoRow(),
                SizedBox(height: 40.h),
                ResumeAndMakeAResumeLine(),
                SizedBox(height: 12.h),
                ResumeContiner(),
                SizedBox(height: 19.h),
                PortfolioAndSeeAllLine(),
                SizedBox(height: 12.h),
                PortfolioContant(),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
