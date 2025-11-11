import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/profile/widgets/custom_dotted_contenier.dart';
import 'package:work_wave/features/profile/widgets/portfolio_optional_btns.dart';
import 'package:work_wave/features/profile/widgets/resume_and_protfolio_app_bar.dart';

class ResumePortfolioPage extends StatelessWidget {
  const ResumePortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFD),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ResumeAndProtfolioAppBar(),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorderContanier(),
                SizedBox(height: 48.h),
                PortfolioOptionalBtns(),
                SizedBox(height: 30.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                    backgroundColor: AppColors.primary,
                    content: CustomText(
                      txt: 'Add More',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 48.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
