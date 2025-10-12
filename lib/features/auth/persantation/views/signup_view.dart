import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/utils/responsive_helper.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/features/auth/persantation/views/widgets/signup_form.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() => _isLoading = false);
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
                      SizedBox(height: responsive.setHeight(40)),
                      _buildAnimatedChild(
                        0,
                        Icon(
                          Icons.waves_rounded,
                          size: responsive.setWidth(70),
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: responsive.setHeight(16)),
                      _buildAnimatedChild(
                        1,
                        CustomText(
                          txt: 'Create Account',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: responsive.setHeight(8)),
                      _buildAnimatedChild(
                        2,
                        CustomText(
                          txt: 'Sign up to get started',
                          fontSize: 16,
                          color: AppColors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(height: responsive.setHeight(30)),
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
                            child: SignupForm(
                              formKey: _formKey,
                              emailController: _emailController,
                              passwordController: _passwordController,
                              nameController: _nameController,
                              responsive: responsive,
                              isLoading: _isLoading,
                              signup: _signup,
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
