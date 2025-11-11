import 'package:flutter/material.dart';

final List<Map<String, dynamic>> applicationsItems = [
  {'icon': Icons.person_outline, 'title': 'Profile Visibility'},
  {'icon': Icons.notifications_none, 'title': 'Notification'},
  {'icon': Icons.lock_outline, 'title': 'Change Password'},
  {'icon': Icons.language_outlined, 'title': 'Language'},
  {'icon': Icons.brightness_4_outlined, 'title': 'Theme'},
  {
    'icon': Icons.delete_outline,
    'title': 'Delete Account',
    'color': Colors.red,
  },
];

final List<Map<String, dynamic>> aboutItems = [
  {'icon': Icons.privacy_tip_outlined, 'title': 'Privacy'},
  {'icon': Icons.article_outlined, 'title': 'Terms and conditions'},
  {'icon': Icons.help_outline, 'title': 'Help Center'},
  {'icon': Icons.support_agent_outlined, 'title': 'Support'},
  {'icon': Icons.info_outline, 'title': 'About'},
];
