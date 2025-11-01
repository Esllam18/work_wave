import 'package:flutter/material.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/features/jops/widgets/apply_success_widget.dart';

class ApplySuccessView extends StatelessWidget {
  const ApplySuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplySuccessWidget(
      imagePath: AppImages.successIllustration,
      title: "Successful",
      subtitle: "You’ve successfully applied to Spotify UX Intern role.",
      buttonText: "Browse Jobs",
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
