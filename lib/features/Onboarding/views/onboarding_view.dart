import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/utils/responsive_helper.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/Onboarding/data/onboarding_data.dart';
import 'package:work_wave/core/widgets/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _fadeController.forward();

    _pageController.addListener(() {
      if (_pageController.page != null) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < onboardPages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      GoRouter.of(context).push(RouteNames.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final isLastPage = _currentPage == onboardPages.length - 1;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.goNamed(RouteNames.login),
                  child: CustomText(
                    txt: isLastPage ? '' : 'Skip',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardPages.length,
                  itemBuilder: (context, index) {
                    return TweenAnimationBuilder<double>(
                      key: ValueKey(index),
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                      builder: (context, value, child) => Opacity(
                        opacity: value,
                        child: Transform.scale(
                          scale: 0.8 + (0.2 * value),
                          child: child,
                        ),
                      ),
                      child: OnboardingPage(item: onboardPages[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(responsive.setWidth(32)),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: onboardPages.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: responsive.setHeight(10),
                        dotWidth: responsive.setWidth(10),
                        spacing: responsive.setWidth(6),
                        activeDotColor: AppColors.primary,
                        dotColor: AppColors.lightGrey,
                      ),
                    ),
                    SizedBox(height: responsive.setHeight(40)),
                    SizedBox(
                      width: double.infinity,
                      height: responsive.setHeight(56),
                      child: CustomButton(
                        backgroundColor: AppColors.primary,
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              txt: isLastPage ? 'Get Started' : 'Next',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                            if (!isLastPage) ...[
                              SizedBox(width: responsive.setWidth(8)),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: AppColors.white,
                                size: 22,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
