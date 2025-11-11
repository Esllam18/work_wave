import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text_form_field.dart';
import 'package:work_wave/features/Search/data/data_source.dart';
import 'package:work_wave/features/Search/data/models/search_item_model.dart';
import 'package:work_wave/features/Search/widgets/search_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  List<SearchItemModel> filteredJobs = [];
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    filteredJobs = allJobs;
  }

  void searchJobs(String query) {
    final input = query.toLowerCase();
    var results = allJobs.where((job) {
      final titleLower = job.title.toLowerCase();
      final companyLower = job.subTitle.toLowerCase();
      return titleLower.contains(input) || companyLower.contains(input);
    }).toList();

    // Apply filter
    if (selectedFilter != 'All') {
      results = results
          .where((job) => job.jobStatus == selectedFilter)
          .toList();
    }

    setState(() => filteredJobs = results);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextormField(
                        controller: _controller,
                        hint: 'Search a job or position',
                        prefixIcon: CupertinoIcons.search,
                        onChanged: searchJobs,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.all(14.w),
                      child: Image.asset(
                        AppIcons.filter,
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SearchItem(filteredJobs: filteredJobs),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
