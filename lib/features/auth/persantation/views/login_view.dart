import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/utils/responsive_helper.dart';
import 'package:work_wave/core/widgets/custom_snackbar.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/auth/persantation/views/widgets/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() => _isLoading = false);
        CustomSnackBar.show(
          context,
          message: 'Login successful!',
          type: SnackBarType.success,
        );
        context.goNamed(RouteNames.root);
      }
    }
  }

  Widget _buildAnimatedChild(int index, Widget child) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 400 + (index * 100)),
      curve: Curves.easeOut,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: child,
        ),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.primary.withOpacity(0.7)],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      SizedBox(height: responsive.setHeight(60)),
                      _buildAnimatedChild(
                        0,
                        Icon(
                          Icons.waves_rounded,
                          size: responsive.setWidth(80),
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: responsive.setHeight(20)),
                      _buildAnimatedChild(
                        1,
                        CustomText(
                          txt: 'Welcome Back!',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: responsive.setHeight(8)),
                      _buildAnimatedChild(
                        2,
                        CustomText(
                          txt: 'Sign in to continue',
                          fontSize: 16,
                          color: AppColors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(height: responsive.setHeight(40)),
                      Expanded(
                        child: _buildAnimatedChild(
                          3,
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(responsive.setWidth(40)),
                              ),
                            ),
                            child: LoginForm(
                              formKey: _formKey,
                              emailController: _emailController,
                              passwordController: _passwordController,
                              responsive: responsive,
                              isLoading: _isLoading,
                              login: _login,
                            ),
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
      ),
    );
  }
}
