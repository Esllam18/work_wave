import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Settings/data/data_source.dart';
import 'package:work_wave/features/Settings/widgets/settings_item.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: "About",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: aboutItems.length,
          itemBuilder: (context, index) {
            final item = aboutItems[index];
            return SettingsItem(
              icon: item['icon'] as IconData,
              title: item['title'] as String,
              color: item['color'] as Color?,
              onTap: item['onTap'] as VoidCallback?,
            );
          },
        ),
      ],
    );
  }
}
