import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white60,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Gap(28),
                HomeHeader(),
                Gap(47),
                HomeSearch(),
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
    );
  }
}
