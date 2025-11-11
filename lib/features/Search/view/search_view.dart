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

  String searchText = '';

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        searchText = _controller.text.trim();
      });
    });
  }

  List<SearchItemModel> get _filteredJobs {
    if (searchText.isEmpty) {
      return allJobs;
    }

    final query = searchText.toLowerCase();

    return allJobs.where((job) {
      final title = job.title.toLowerCase();
      final subTitle = job.subTitle.toLowerCase();
      return title.contains(query) || subTitle.contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                SearchItem(filteredJobs: _filteredJobs),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
