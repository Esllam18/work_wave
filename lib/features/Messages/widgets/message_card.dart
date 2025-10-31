import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.tital,
    required this.subTital,
    required this.time,
    required this.image,
    required this.nuberOfMessages,
    required this.isRead,
  });
  final String tital;
  final String subTital;
  final String time;
  final String image;
  final String nuberOfMessages;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: CustomText(
        txt: tital,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xff0D0D26),
      ),
      subtitle: CustomText(
        txt: subTital,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: isRead ? Colors.grey : Color(0xff0D0D26),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
        child: Image.asset(image),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText(
            txt: time,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff0D0D26),
          ),
          Gap(10.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: isRead
                ? SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 6,
                    ),
                    child: CustomText(
                      txt: nuberOfMessages,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
