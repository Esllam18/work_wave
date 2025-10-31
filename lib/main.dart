import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/router/app_router.dart';

void main() {
  runApp(const WorkWave());
}

class WorkWave extends StatelessWidget {
  const WorkWave({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp.router(
          title: 'WorkWave',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
