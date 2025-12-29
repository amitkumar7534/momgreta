import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:momgreta/components/coreComponents/TextView.dart';
import 'package:momgreta/components/styles/appColors.dart';
import 'package:momgreta/components/styles/textStyles.dart';
import 'package:momgreta/screens/authentication/login_screen.dart';
import 'package:momgreta/utils/SharedPrefHelper/shared_pref_helper.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';
import '../home_screen/home_controller.dart';
import 'delete_account_dialog.dart';
import 'edit_profile_screen/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var homeController = Get.find<HomeController>();
  int notificationCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Blue Header
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and Notification Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Mom',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Greta',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.buttonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    // Title
                    Text(
                      'Admin Profile',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Admin Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.grey.withOpacity(0.3),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Avatar with Initials
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Obx(() {
                                  String name = homeController.profileModel.value.name ?? 'Admin';
                                  String initials = name
                                      .split(' ')
                                      .take(2)
                                      .map((e) => e[0])
                                      .join()
                                      .toUpperCase();
                                  return Text(
                                    initials,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white,
                                    ),
                                  );
                                }),
                              ),
                            ),
                            SizedBox(width: 16),
                            // Admin Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                     Text(
                                      SharedPrefHelper.profile?.data?.admin?.fullName ?? 'Admin Greta',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.findHelp,
                                      ),
                                    ),
                                  SizedBox(height: 4),
                                  Text(
                                    'System Administrator',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                   Text(
                                      SharedPrefHelper.profile?.data?.admin?.email ?? '',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.grey,
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),

                    /*  // User Management Section
                      Text(
                        'USER MANAGEMENT',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grey,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Add Parent Button
                      _buildActionCard(
                        icon: LucideIcons.user_plus,
                        title: 'Add Parent',
                        subtitle: 'Create new parent account',
                        color: AppColors.buttonColor,
                        onTap: () {
                          // Handle add parent
                        },
                      ),
                      SizedBox(height: 12),

                      // Add Staff Button
                      _buildActionCard(
                        icon: LucideIcons.users,
                        title: 'Add Staff',
                        subtitle: 'Create new staff account',
                        color: AppColors.buttonColor,
                        onTap: () {
                          // Handle add staff
                        },
                      ),
                      SizedBox(height: 30),*/

                      // Legal & Support Section
                      Text(
                        'LEGAL & SUPPORT',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grey,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Privacy Policy
                      _buildMenuItem(
                        icon: LucideIcons.shield,
                        title: 'Privacy Policy',
                        onTap: () {
                          // Handle privacy policy
                        },
                      ),
                      SizedBox(height: 12),

                      // Terms & Conditions
                      _buildMenuItem(
                        icon: LucideIcons.file_text,
                        title: 'Terms & Conditions',
                        onTap: () {
                          // Handle terms
                        },
                      ),
                      SizedBox(height: 12),

                      // Logout
                      _buildMenuItem(
                        icon: LucideIcons.log_out,
                        title: 'Logout',
                        subtitle: 'Sign out of your account',
                        isDestructive: true,
                        onTap: () {
                          _showLogoutDialog(context);
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppColors.white,
                size: 24,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              LucideIcons.chevron_right,
              color: AppColors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    bool isDestructive = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDestructive
              ? AppColors.red.withOpacity(0.05)
              : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDestructive
                ? AppColors.red.withOpacity(0.3)
                : AppColors.grey.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isDestructive
                    ? AppColors.red.withOpacity(0.1)
                    : AppColors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isDestructive ? AppColors.red : AppColors.grey,
                size: 20,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? AppColors.red : AppColors.findHelp,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDestructive
                            ? AppColors.red.withOpacity(0.7)
                            : AppColors.grey,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              LucideIcons.chevron_right,
              color: isDestructive ? AppColors.red : AppColors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.log_out,
                  color: AppColors.red,
                  size: 32,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.findHelp,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Are you sure you want to sign out of your account?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: AppColors.grey.withOpacity(0.3)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                     //   homeController.logoutAccount(context);
                        SharedPrefHelper.profile = null;
                        context.pushAndClearNavigator(LoginPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}