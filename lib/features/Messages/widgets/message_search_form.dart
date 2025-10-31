import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class MessageSearch extends StatelessWidget {
  const MessageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.accent,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),

          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),

          borderRadius: BorderRadius.circular(16),
        ),

        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Icon(CupertinoIcons.search, color: AppColors.accent),
        ),
        hint: CustomText(
          txt: 'Search a chat or message',
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.accent,
        ),
      ),
    );
  }
}
