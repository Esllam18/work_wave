import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/features/Notifications/views/notifications_view.dart';
import 'package:work_wave/features/home/persantaion/views/home_veiw.dart';
import 'package:work_wave/features/Messages/views/message_view.dart';
import 'package:work_wave/features/seved/views/seved_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const MessageView(),
    const SevedView(),
    const NotificationsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Ionicons.home_sharp, index: 0),
                _buildNavItem(icon: Ionicons.mail_sharp, index: 1),
                _buildNavItem(icon: Ionicons.bookmark, index: 2),
                _buildNavItem(icon: Ionicons.grid, index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.deferToChild,
      child: Container(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Icon(
                icon,
                size: 26,
                color: isSelected ? AppColors.primary : Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isSelected ? 6 : 6,
              width: isSelected ? 6 : 6,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
