import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/utils/responsive_helper.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          context.goNamed(RouteNames.onboarding);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // ignore: deprecated_member_use
            colors: [AppColors.primary, AppColors.primary.withOpacity(0.7)],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => FadeTransition(
              opacity: _fadeAnimation,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(responsive.setWidth(24)),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.waves_rounded,
                        size: responsive.setWidth(80),
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: responsive.setHeight(24)),
                    CustomText(
                      txt: 'Work Wave',
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                    SizedBox(height: responsive.setHeight(8)),
                    CustomText(
                      txt: 'Find Your Perfect Job',
                      fontSize: 16,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
