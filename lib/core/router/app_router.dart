import 'package:go_router/go_router.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/features/Onboarding/views/onboarding_view.dart';
import 'package:work_wave/features/auth/persantation/views/login_view.dart';
import 'package:work_wave/features/auth/persantation/views/signup_view.dart';
import 'package:work_wave/features/home/persantaion/views/home_veiw.dart';
import 'package:work_wave/features/jops/views/jop_details_view.dart';
import 'package:work_wave/features/splash/views/splash_view.dart';
import 'package:work_wave/features/wlecome_view/welcome_view.dart';
import 'package:work_wave/root.dart';

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
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RouteNames.signUp,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: RouteNames.welcome,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(path: RouteNames.root, builder: (context, state) => const Root()),

    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RouteNames.jopDetails,
      builder: (context, state) => const JopDetailsView(),
    ),
  ],
);
