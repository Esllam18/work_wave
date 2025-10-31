import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Notifications/models/notification_model.dart';
import 'package:work_wave/features/Notifications/widgets/notification_item.dart';
import 'package:work_wave/features/Notifications/widgets/notification_title.dart';

class NotificationItemsListView extends StatelessWidget {
  const NotificationItemsListView({
    super.key,
    required this.notificationsNewActivity,
    required this.notificationsForApplications,
    required this.notificationsForInterview,
  });
  final List<NotificationModel> notificationsNewActivity;
  final List<NotificationModel> notificationsForApplications;
  final List<NotificationModel> notificationsForInterview;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 New Activity Section
          CustomText(
            txt: 'New activity',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            color: AppColors.black,
          ),
          Gap(12.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notificationsNewActivity.length,
            itemBuilder: (context, index) {
              final item = notificationsNewActivity[index];
              return NotificationItem(
                textSpan: item.textSpan,
                orginalText: item.orginalText,
                image: item.image,
                time: item.time,
                isRead: item.isRead,
              );
            },
          ),
          Gap(12.h),

          // 🔹 Applications Section
          NotificationTitle(notificationTitle: 'Applications'),
          Gap(8.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notificationsForApplications.length,
            itemBuilder: (context, index) {
              final item = notificationsForApplications[index];
              return NotificationItem(
                textSpan: item.textSpan,
                orginalText: item.orginalText,
                image: item.image,
                time: item.time,
                isRead: item.isRead,
              );
            },
          ),
          Gap(12.h),

          // 🔹 Interview Section
          NotificationTitle(notificationTitle: 'Interview'),
          Gap(8.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notificationsForInterview.length,
            itemBuilder: (context, index) {
              final item = notificationsForInterview[index];
              return NotificationItem(
                textSpan: item.textSpan,
                orginalText: item.orginalText,
                image: item.image,
                time: item.time,
                isRead: item.isRead,
              );
            },
          ),
          Gap(16.h),
        ],
      ),
    );
  }
}
