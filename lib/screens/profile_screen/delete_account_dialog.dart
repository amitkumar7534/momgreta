import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momgreta/components/styles/textStyles.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';
import 'package:momgreta/utils/extensions/extensions.dart';

import '../home_screen/home_controller.dart';

class DeleteAccountDialog extends StatelessWidget {
   DeleteAccountDialog({super.key});

  var homeController = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: const Color(0xFF1E1E1E), // dark background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.warning_amber_rounded,
                    color: Colors.redAccent, size: 28),
                const SizedBox(width: 10),
                const Text(
                  "Delete Account?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "This action cannot be undone. This will permanently delete your account and remove all your data including:",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            const _BulletPoint(
                text: "All your meal logs and photos"),
            const _BulletPoint(
                text: "Your nutrition analytics and insights"),
            const _BulletPoint(
                text: "Your social activity and followers"),
            const _BulletPoint(
                text: "Your profile and account settings"),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  height: 43,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.pop();
                    },
                    label:  Text(
                      "Cancel",
                      style: 14.txtBoldWhite,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade600),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    homeController.deleteAccount(context).applyLoader;
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text("Delete Account"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ",
              style: TextStyle(color: Colors.white, fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
