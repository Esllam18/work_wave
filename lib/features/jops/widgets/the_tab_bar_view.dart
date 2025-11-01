import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/features/jops/widgets/description_body.dart';

class TheTabBarView extends StatefulWidget {
  const TheTabBarView({super.key});

  @override
  State<TheTabBarView> createState() => _TheTabBarViewState();
}

class _TheTabBarViewState extends State<TheTabBarView>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabs = [
    Tab(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text('Description'),
      ),
    ),
    Tab(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text('Requirement'),
      ),
    ),
    Tab(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text('About'),
      ),
    ),
    Tab(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text('Reviews'),
      ),
    ),
  ];
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: Column(
        children: [
          TabBar(
            labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            tabAlignment: TabAlignment.start,
            tabs: tabs,
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.grey,
            indicatorPadding: const EdgeInsets.only(bottom: 10),
            dividerColor: Colors.transparent,
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1,
          ),
          Gap(20.h),
          SizedBox(
            height: MediaQuery.of(context).size.height * .39,
            child: TabBarView(
              controller: tabController,
              children: const [
                DescriptionBody(),
                Center(child: Text('Requirement content here')),
                Center(child: Text('About the company...')),
                Center(child: Text('Reviews section...')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
