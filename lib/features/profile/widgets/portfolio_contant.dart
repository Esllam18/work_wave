import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/features/profile/data/data_source.dart';

class PortfolioContant extends StatelessWidget {
  const PortfolioContant({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 12.h,
      ),
      itemCount: portfolioImages.length,
      itemBuilder: (context, index) {
        final item = portfolioImages[index];
        return Image.asset(item);
      },
    );
  }
}
