import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/features/Saved/models/jops_saved.dart';
import 'package:work_wave/features/Saved/widgets/saved_jop_card.dart';

class JobsSavedCardListView extends StatelessWidget {
  const JobsSavedCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JobsSavedModel> jobsSaved = [
      JobsSavedModel(
        image: AppImages.spotify,
        title: 'UX Intern',
        salary: '\$88,000/y',
        saveStatus: 'Closed',
        jobStatus: 'Full-Time',
        subTitle: 'Spotify',
        location: 'Los Angeles, US',
      ),
      JobsSavedModel(
        image: AppImages.dribbble,
        title: 'UX Designer',
        salary: '\$96,000/y',
        saveStatus: 'Open',
        jobStatus: 'Full-Time',
        subTitle: 'Dribbble',
        location: 'San Francisco, US',
      ),
      JobsSavedModel(
        image: AppImages.facebook,
        title: 'Product Designer',
        salary: '\$120,000/y',
        saveStatus: 'Applied',
        jobStatus: 'Full-Time',
        subTitle: 'Facebook',
        location: 'San Jose, US',
      ),
    ];

    return ListView.separated(
      itemCount: jobsSaved.length,
      separatorBuilder: (_, __) => Gap(16.h),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = jobsSaved[index];
        return JobsSavedCard(
          item: item,
          onTap: () => GoRouter.of(context).push(RouteNames.jopDetails),
        );
      },
    );
  }
}
