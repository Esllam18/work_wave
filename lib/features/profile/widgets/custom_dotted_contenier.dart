import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class DottedBorderContanier extends StatelessWidget {
  const DottedBorderContanier({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),

        CustomText(
          txt: 'Resume or CV',
          color: AppColors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 24.h),
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(10.r),
            dashPattern: const [10, 8],
            color: AppColors.primary,
            strokeWidth: 1.5,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                CustomText(
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  txt:
                      'Upload your CV or Resume and use it when you apply for jobs',
                  color: AppColors.accent,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 32.h),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F3),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.picture_as_pdf,
                          color: Colors.red,
                          size: 40.sp,
                        ),
                        title: CustomText(
                          txt: 'Rifat_CV_UX Designer',
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitle: CustomText(
                          txt: '287 KB',
                          color: AppColors.accent,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -20.h,
                      right: -20.w,
                      child: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Center(
                  child: CustomButton(
                    backgroundColor: AppColors.primary,
                    content: CustomText(
                      txt: 'Add More',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
