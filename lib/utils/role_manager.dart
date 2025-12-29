import 'package:flutter/material.dart';

class RoleManager {
  // Singleton
  RoleManager._privateConstructor();
  static final RoleManager instance = RoleManager._privateConstructor();

  // Notifier
  ValueNotifier<String?> selectedRole = ValueNotifier(null);

  void setRole(String roleId) {
    selectedRole.value = roleId;
  }
}
