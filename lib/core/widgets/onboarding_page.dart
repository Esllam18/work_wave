import 'package:flutter/material.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/utils/responsive_helper.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Onboarding/model/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.setWidth(32)),
      child: Column(
        children: [
          // 1. Image (Placeholder)
          SizedBox(
            height: responsive.setHeight(
              350,
            ), // Takes up a good portion of the screen

            child: Image.asset(item.imagePath, fit: BoxFit.contain),
          ),

          SizedBox(height: responsive.setHeight(40)),

          // 2. Title
          CustomText(
            txt: item.title,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: responsive.setHeight(16)),

          // 3. Description
          CustomText(
            txt: item.description,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
