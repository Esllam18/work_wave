import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/jops/widgets/jop_details_header.dart';
import 'package:work_wave/features/jops/widgets/the_tab_bar_view.dart';

class JopDetailsView extends StatelessWidget {
  const JopDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .35,
                child: JopDetailsHeader(),
              ),
              Gap(10.h),
              TheTabBarView(),

              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24.w, bottom: 16.h),
                  child: CustomButton(
                    backgroundColor: AppColors.primary,
                    content: CustomText(
                      txt: 'Apply Now',

                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () =>
                        GoRouter.of(context).push(RouteNames.applayToJop),
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
