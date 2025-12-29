import 'package:flutter/material.dart';
import 'package:momgreta/components/styles/textStyles.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';

import '../../components/styles/appColors.dart';
import '../dashboard.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE75959),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Welcome to SlyceUp',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Discover • Track • Share',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // SlyceUp logo placeholder
            Center(
              child: Image.asset(
                'assets/slyceup_logo.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: width,
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xFF311E23),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '🎉 Welcome to SlyceUp Demo!',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: width*0.7,
                    child: Text(
                      'Explore all features with sample data - no email confirmation required.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 36),
            _FeatureTile(
              icon: Icons.camera_alt_outlined,
              iconColor: const Color(0xFFE75959),
              title: 'Snap Your Meals',
              subtitle: 'Quick photo capture of your food',
            ),
            const SizedBox(height: 14),
            _FeatureTile(
              icon: Icons.insights_outlined,
              iconColor: const Color(0xFF4AC6B7),
              title: 'Get AI Insights',
              subtitle: 'Nutrition facts and food origin',
            ),
            const SizedBox(height: 14),
            _FeatureTile(
              icon: Icons.people_outline,
              iconColor: const Color(0xFFF7A95F),
              title: 'Share & Connect',
              subtitle: 'Join a community of food lovers',
            ),

            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.pushAndClearNavigator(DashboardPage(index:0));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: 14.txtMediumWhite,
                    ),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_forward,color: Colors.white,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _FeatureTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                  )),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}