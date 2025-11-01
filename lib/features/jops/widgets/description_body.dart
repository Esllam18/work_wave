import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              txt:
                  'We are the teams 83.17 of all of Facebook\'s products used by billions of people around the world.Want to build new features and improve existing products like Messenger, Video, Groups, News Feed, Search and more?',
              fontSize: 14.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
              maxLines: 6,
            ),

            Gap(16.h),
            CustomText(
              txt: 'Responsibilities:',
              fontSize: 14.sp,
              color: Color(0xff494A50),
              fontWeight: FontWeight.w400,
            ),
            Gap(8.h),
            _buildResponsibility(
              '💡 Full stack web/mobile application development with a variety of coding languages',
            ),
            _buildResponsibility(
              '💡 Create consumer products and features using internal programming language Hack',
            ),
            _buildResponsibility(
              '💡 Implement web or mobile interfaces using XHTML, CSS, and JavaScript',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsibility(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomText(
        txt: text,
        fontSize: 14.sp,
        color: AppColors.grey,
        fontWeight: FontWeight.w500,
        maxLines: 4,
      ),
    );
  }
}
