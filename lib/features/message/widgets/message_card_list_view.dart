import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/message/widgets/message_card.dart';

class MessageCardListView extends StatelessWidget {
  const MessageCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: 'Companies',
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: Color(0xff0D0D26),
        ),
        Gap(8.h),

        MessageCard(
          time: '11:45 am',
          tital: 'Google',
          subTital: 'Are you available for an intervi......',
          nuberOfMessages: '1',
          image: AppImages.Google,
        ),
        Gap(8.h),
        MessageCard(
          time: '11:45 am',
          tital: 'HP',
          subTital: 'We are looking forward to takin.....',
          nuberOfMessages: '4',
          image: AppImages.hp,
        ),
        Gap(8.h),
        MessageCard(
          time: '11:45 am',
          tital: 'Spotify',
          subTital: 'Are you available for an intervi......',
          nuberOfMessages: '1',
          image: AppImages.spotify,
        ),
        Gap(15.h),
        CustomText(
          txt: 'Individual Messages',
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: Color(0xff0D0D26),
        ),
        Gap(8.h),
        MessageCard(
          tital: 'Erik John',
          subTital: 'We are looking for a web develo....',
          time: '11:45 am',
          image: AppImages.ellipse1,
          nuberOfMessages: '4',
        ),
        MessageCard(
          tital: 'Nicolas Pooran',
          subTital: 'I checked your portfolio. It looks ....',
          time: '11:45 am',
          image: AppImages.ellipse2,
          nuberOfMessages: '2',
        ),
        MessageCard(
          tital: 'Jessica Jenith',
          subTital: 'Are you available for an interview ...............',
          time: '11:45 am',
          image: AppImages.ellipse3,
          nuberOfMessages: '0',
        ),
        MessageCard(
          tital: 'Rowling Kint',
          subTital: 'Are you available for an interview ...............',
          time: '11:45 am',
          image: AppImages.ellipse4,
          nuberOfMessages: '0',
        ),
      ],
    );
  }
}
