import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(1),
      ),
      width: MediaQuery.of(context).size.width * .8,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.cancel_presentation),
                    onPressed: () => GoRouter.of(context).pop(),
                  ),
                ),
                //  Profile Section
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: const AssetImage(AppImages.maskgroup2),
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        txt: 'Hannah Garcia',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: [
                          CustomText(
                            txt: 'UX Designer',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff95969D),
                            ),
                          ),
                          Image.asset(
                            AppIcons.verified,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: CustomText(
                          txt: 'View Profile',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                //  Scrollable Drawer Items
                Column(
                  children: [
                    _buildDrawerItem(Icons.person, 'Personal Info'),
                    _buildDrawerItem(Icons.article_outlined, 'Applications'),
                    _buildDrawerItem(Icons.work_outline, 'Proposals'),
                    _buildDrawerItem(Icons.description_outlined, 'Resumes'),
                    _buildDrawerItem(Icons.folder_open, 'Portfolio'),
                    _buildDrawerItem(Icons.mail_outline, 'Cover Letters'),
                    _buildDrawerItem(Icons.settings_outlined, 'Settings'),
                  ],
                ),

                //  Logout Button
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: CustomText(
                    txt: 'Logout',
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffE30000),
                    ),
                  ),
                  onTap: () {},
                ),

                SizedBox(height: 10.h),

                //  Go Premium Button
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 18.w,
                    bottom: 14.h,
                  ),
                  child: CustomButton(
                    backgroundColor: AppColors.primary,
                    content: Row(
                      spacing: 5,
                      children: [
                        Image.asset(
                          AppIcons.goPremiumIcon,
                          width: 18.w,
                          height: 24.h,
                        ),
                        CustomText(
                          txt: ' Go Premium',

                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.grey),
      title: CustomText(
        txt: title,
        fontFamily: GoogleFonts.poppins(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ).fontFamily,
      ),
      onTap: () {},
    );
  }
}
