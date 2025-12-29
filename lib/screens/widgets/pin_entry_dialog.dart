import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:momgreta/components/styles/appColors.dart';
import 'package:momgreta/utils/appUtils.dart';

import '../../utils/extensions/extensions.dart';
import '../home_screen/checkin_confirmation_screen.dart';
import '../home_screen/home_controller.dart';

class PinEntryDialog extends StatefulWidget {
  final String action; // "CHECK_IN" or "CHECK_OUT"

  const PinEntryDialog({super.key, required this.action});

  @override
  State<PinEntryDialog> createState() => _PinEntryDialogState();
}

class _PinEntryDialogState extends State<PinEntryDialog> {
  var homeController = Get.find<HomeController>();

  final List<TextEditingController> _controllers = List.generate(
    4,
        (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    4,
        (index) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();
    // Auto focus first field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onDigitEntered(int index, String value) {
    if (value.isNotEmpty) {
      // Move to next field
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // Last digit entered, unfocus
        _focusNodes[index].unfocus();
      }
    }
  }

  void _onBackspace(int index) {
    if (index > 0 && _controllers[index].text.isEmpty) {
      // Move to previous field
      _focusNodes[index - 1].requestFocus();
    }
  }

  bool _isAllDigitsEntered() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  Future<void> _verifyPin() async {
    if (_isAllDigitsEntered()) {
      String pin = _controllers.map((c) => c.text).join();

      Map<String, dynamic> loginData = {"pin": pin};

      // Verify user with PIN
      bool success =
      await homeController.checkUser(context, loginData).applyLoader;

      if (success) {
        // Close PIN dialog
        Navigator.pop(context);

        // Navigate to check-in confirmation screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckInConfirmationScreen(
              action: widget.action,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCheckOut = widget.action == 'CHECK_OUT';
    final accentColor = isCheckOut ? AppColors.buttonColor : AppColors.green;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button
            Padding(
              padding: EdgeInsets.only(top: 16, right: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      LucideIcons.x,
                      color: AppColors.grey,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),

            // Scrollable Content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Lock Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        LucideIcons.lock,
                        color: AppColors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Title
                    Text(
                      'Enter PIN',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.findHelp,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'Enter 4 digit PIN for ${widget.action == "CHECK_IN" ? "Check In" : "Check Out"}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 28),

                    // PIN Input Fields
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: _controllers[index].text.isNotEmpty
                                      ? accentColor.withOpacity(0.1)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: _controllers[index].text.isNotEmpty
                                        ? accentColor
                                        : AppColors.grey.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    textSelectionTheme:
                                    TextSelectionThemeData(
                                      cursorColor: accentColor,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _controllers[index],
                                    focusNode: _focusNodes[index],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    obscureText: true,
                                    obscuringCharacter: '●',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackText,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      fillColor: Colors.transparent,
                                      filled: true,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _onDigitEntered(index, value);
                                      });
                                    },
                                    onTap: () {
                                      // Clear the field when tapped
                                      _controllers[index].clear();
                                      setState(() {});
                                    },
                                    onSubmitted: (value) {
                                      if (index < 3) {
                                        _focusNodes[index + 1].requestFocus();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 28),

                    // Verify Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _isAllDigitsEntered() ? _verifyPin : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isAllDigitsEntered()
                              ? accentColor
                              : AppColors.grey.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'VERIFY PIN',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _isAllDigitsEntered()
                                ? AppColors.white
                                : AppColors.grey,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),

                 /*   // Forgot PIN
                    GestureDetector(
                      onTap: () {
                        AppUtils.toast("Forgot PIN functionality");
                      },
                      child: Text(
                        'Forgot PIN?',
                        style: TextStyle(
                          fontSize: 14,
                          color: accentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 18),*/

                    // Demo Mode Info
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: accentColor.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Demo Mode:',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: accentColor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Enter any 4 digits to unlock. The VERIFY PIN button will activate once all 4 digits are entered.',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.findHelp,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
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