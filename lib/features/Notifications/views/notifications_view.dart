import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Notifications/models/notification_model.dart';
import 'package:work_wave/features/Notifications/widgets/notification_items_list_view.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final List<NotificationModel> notificationsNewActivity = [
    // 🟢 New Activity
    NotificationModel(
      textSpan: 'Fiverr',
      orginalText:
          ' want to take a final interview of you where head of HR will see you!',
      image: AppImages.fiverr,
      time: '12 min ago',
      isRead: false,
    ),
    NotificationModel(
      textSpan: 'Macdonald',
      orginalText:
          ' want to contact with you in 24 hours with proper preparation',
      image: AppImages.macdonald,
      time: '47 min ago',
      isRead: false,
    ),
  ];

  final List<NotificationModel> notificationsForApplications = [
    // 🔵 Applications
    NotificationModel(
      textSpan: 'BMW',
      orginalText:
          ' Your application is submitted successfully to . You can check the status here.',
      image: AppImages.bmw,
      time: '1 hrs ago',
      isRead: true,
    ),
    NotificationModel(
      textSpan: 'Booking.com',
      orginalText:
          ' reviewing your application, cover letter and portfolio. All the best!',
      image: AppImages.booking,
      time: '3 hrs ago',
      isRead: true,
    ),
  ];

  final List<NotificationModel> notificationsForInterview = [
    // 🔴 Interview
    NotificationModel(
      textSpan: 'Beats',
      orginalText: ' liked your resume and want to take an interview of you.',
      image: AppImages.beats,
      time: '4 hrs ago',
      isRead: true,
    ),
    NotificationModel(
      textSpan: 'Behance.',
      orginalText:
          ' Congratulations! You passed the first round on  Be prepare for next!',
      image: AppImages.behance,
      time: '6 hrs ago',
      isRead: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CustomText(
            txt: 'Notifications',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotificationItemsListView(
                  notificationsNewActivity: notificationsNewActivity,
                  notificationsForApplications: notificationsForApplications,
                  notificationsForInterview: notificationsForInterview,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
