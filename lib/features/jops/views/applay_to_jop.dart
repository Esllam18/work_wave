import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/jops/widgets/applay_to_jop_header.dart';
import 'package:work_wave/features/jops/widgets/select_profile_section.dart';
import 'package:work_wave/features/jops/widgets/text_feild_and_upload_secation.dart';

class ApplayToJop extends StatelessWidget {
  const ApplayToJop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFD),
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: CustomText(
            txt: 'Apply',

            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApplayToJopHeader(
                tital: 'Product Manager',
                salery: r'$84,000/y',
                secondTriling: 'Florida, US',
                subTital: 'Beats',
                image: AppImages.beats,
              ),
              Gap(18.h),
              SelectProfileSection(),
              Gap(22.0.h),
              TextFeildAndUploadSecation(),
              Gap(16.h),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24.w, bottom: 16.h),
                  child: CustomButton(
                    backgroundColor: AppColors.primary,
                    content: CustomText(
                      txt: 'Apply ',

                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () =>
                        GoRouter.of(context).push(RouteNames.successAppalied),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
