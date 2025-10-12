import 'package:go_router/go_router.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/features/Onboarding/views/onboarding_view.dart';
import 'package:work_wave/features/auth/persantation/views/login_view.dart';
import 'package:work_wave/features/auth/persantation/views/signup_view.dart';
import 'package:work_wave/features/splash/views/splash_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteNames.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashView(),
    ),

    // NEW: Onboarding Route
    GoRoute(
      path: RouteNames.onboarding,
      name: RouteNames.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),

    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginView(), // Added const
    ),
    GoRoute(
      path: RouteNames.signUp,
      builder: (context, state) => const SignupView(), // Added const
    ),
    // GoRoute(
    //   path: RouteNames.root,
    //   builder: (context, state) => const Root(), // Added const
    // ),
    // GoRoute(
    //   path: RouteNames.productDetails,
    //   builder: (context, state) => const ProductDetailsView(), // Added const
    // ),
    // GoRoute(
    //   path: RouteNames.checkoutView,
    //   builder: (context, state) => const CheckoutView(), // Added const
    // ),
    // GoRoute(
    //   path: RouteNames.home,
    //   builder: (context, state) => const HomePage(), // Added const
    // ),
  ],
);
