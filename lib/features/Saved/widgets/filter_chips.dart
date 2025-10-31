import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class FilterChips extends StatefulWidget {
  const FilterChips({super.key});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  final List<String> filters = ['All', 'Design', 'Developer', 'Manager'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final bool isSelected = selectedIndex == index;

          return ChoiceChip(
            label: CustomText(
              txt: filters[index],
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            selected: isSelected,
            disabledColor: AppColors.secondary,
            backgroundColor: AppColors.secondary,
            selectedColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isSelected ? AppColors.primary : Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
            showCheckmark: false,
            onSelected: (value) {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
