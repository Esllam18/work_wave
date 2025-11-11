import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/features/home/persantaion/widgets/custom_drawer.dart';
import 'package:work_wave/features/home/persantaion/widgets/featured_jobs_card.dart';
import 'package:work_wave/features/home/persantaion/widgets/home_header.dart';
import 'package:work_wave/features/home/persantaion/widgets/home_search.dart';
import 'package:work_wave/features/home/persantaion/widgets/popular_job_card.dart';
import 'package:work_wave/features/home/persantaion/widgets/tital_jop_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.white60,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Gap(28),
                  HomeHeader(),
                  Gap(47),
                  GestureDetector(
                    onTap: () => GoRouter.of(context).push(RouteNames.search),
                    child: HomeSearch(),
                  ),
                  Gap(40),
                  TitalCollactionName(titalJop: 'Featured Jobs'),
                  Gap(20),
                  FeaturedJobsListView(),
                  Gap(40),
                  TitalCollactionName(titalJop: 'Popular Jobs'),
                  Gap(20),
                  PopularJobsListView(),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
