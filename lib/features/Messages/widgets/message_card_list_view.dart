import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Messages/widgets/message_card.dart';
import 'package:work_wave/features/Messages/models/message_model.dart';

class MessageCardListView extends StatelessWidget {
  const MessageCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MessageModel> companyMessages = [
      MessageModel(
        title: 'Google',
        subTitle: 'Are you available for an intervi......',
        time: '11:45 am',
        image: AppImages.google,
        numberOfMessages: '1',
        isRead: false,
      ),
      MessageModel(
        title: 'HP',
        subTitle: 'We are looking forward to takin.....',
        time: '11:45 am',
        image: AppImages.hp,
        numberOfMessages: '4',
        isRead: false,
      ),
      MessageModel(
        title: 'Spotify',
        subTitle: 'Are you available for an intervi......',
        time: '11:45 am',
        image: AppImages.spotify,
        numberOfMessages: '1',
        isRead: true,
      ),
    ];

    final List<MessageModel> individualMessages = [
      MessageModel(
        title: 'Erik John',
        subTitle: 'We are looking for a web develo....',
        time: '11:45 am',
        image: AppImages.ellipse1,
        numberOfMessages: '4',
        isRead: false,
      ),
      MessageModel(
        title: 'Nicolas Pooran',
        subTitle: 'I checked your portfolio. It looks ....',
        time: '11:45 am',
        image: AppImages.ellipse2,
        numberOfMessages: '2',
        isRead: false,
      ),
      MessageModel(
        title: 'Jessica Jenith',
        subTitle: 'Are you available for an interview ...............',
        time: '11:45 am',
        image: AppImages.ellipse3,
        numberOfMessages: '0',
        isRead: true,
      ),
      MessageModel(
        title: 'Rowling Kint',
        subTitle: 'Are you available for an interview ...............',
        time: '11:45 am',
        image: AppImages.ellipse4,
        numberOfMessages: '0',
        isRead: true,
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏢 Companies Section
            CustomText(
              txt: 'Companies',
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff0D0D26),
            ),
            Gap(8.h),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: companyMessages.length,
              itemBuilder: (context, index) {
                final message = companyMessages[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: MessageCard(
                    tital: message.title,
                    subTital: message.subTitle,
                    time: message.time,
                    image: message.image,
                    nuberOfMessages: message.numberOfMessages,
                    isRead: message.isRead,
                  ),
                );
              },
            ),

            Gap(15.h),

            CustomText(
              txt: 'Individual Messages',
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff0D0D26),
            ),
            Gap(8.h),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: individualMessages.length,
              itemBuilder: (context, index) {
                final message = individualMessages[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: MessageCard(
                    tital: message.title,
                    subTital: message.subTitle,
                    time: message.time,
                    image: message.image,
                    nuberOfMessages: message.numberOfMessages,
                    isRead: message.isRead,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
