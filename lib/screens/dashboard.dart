import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:momgreta/screens/profile_screen/user_profile_screen.dart';

import '../components/styles/appColors.dart';

import 'home_screen/home_screen.dart';
import 'insights/insights_screen.dart';

class DashboardPage extends StatefulWidget {
  final int index;
  const DashboardPage({super.key, required this.index});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    InsightsScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
   // _handleCameraAccess();
    setState(() {
      _selectedIndex = widget.index;
    });
  }

  Future<void> _handleCameraAccess() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
    } else {
      await Permission.camera.request();
      try {
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _screens[_selectedIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(LucideIcons.house, 'Home', 0),
                _buildNavItem(LucideIcons.clock, 'History', 1),
                _buildNavItem(LucideIcons.user, 'Profile', 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryBlue : AppColors.grey,
            size: 26,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryBlue : AppColors.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}