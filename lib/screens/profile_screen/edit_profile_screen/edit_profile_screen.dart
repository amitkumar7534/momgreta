import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:momgreta/components/styles/appColors.dart';
import 'package:momgreta/components/styles/textStyles.dart';
import 'package:momgreta/screens/home_screen/home_controller.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';
import 'package:momgreta/utils/extensions/extensions.dart';

import '../../../components/coreComponents/EditText.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var homeController = Get.find<HomeController>();

  final nameController = TextEditingController();
  final displayNameController = TextEditingController();
  final customAllergenController = TextEditingController();
  final bioController = TextEditingController();

  List<String> selectedPreferences = [];
  List<String> allPreferences = [];

  List<String> selectedAllergens = [];
  List<String> allAllergens = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> editUser = {
                  "name": nameController.text,
                  "display_name": displayNameController.text,
                  "bio": bioController.text,
                  "dietary_preferences": selectedPreferences,
                  "allergies": selectedAllergens,
                };
                await homeController.editProfile(editUser).applyLoader;
                await homeController.getProfile().applyLoader;
                context.pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Save"),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Basic Info",
                style: TextStyle(color: Colors.grey, fontSize: 19),
              ),
              const SizedBox(height: 20),

              EditText(
                hint: 'Enter your name',
                label: 'Name',
                controller: nameController,
                labelStyle: 14.txtMediumWhite,
                hintStyle: 14.txtMediumgrey,
                inputType: TextInputType.text,
                filledColor: Colors.grey.withOpacity(0.2),
                borderColor: Colors.transparent,
                textStyle: 14.txtMediumWhite,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              EditText(
                hint: 'Enter your Display Name',
                label: 'Display Name',
                controller: displayNameController,
                labelStyle: 14.txtMediumWhite,
                hintStyle: 14.txtMediumgrey,
                inputType: TextInputType.text,
                filledColor: Colors.grey.withOpacity(0.2),
                borderColor: Colors.transparent,
                textStyle: 14.txtMediumWhite,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Display Name cannot be empty';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              EditText(
                hint: 'Enter your bio',
                label: 'Bio',
                controller: bioController,
                labelStyle: 14.txtMediumWhite,
                hintStyle: 14.txtMediumgrey,
                inputType: TextInputType.text,
                filledColor: Colors.grey.withOpacity(0.2),
                borderColor: Colors.transparent,

                textStyle: 14.txtMediumWhite,
                noOfLines: null,
                maxLength: 150,
              ),

              const SizedBox(height: 30),
              const Text(
                "Dietary Preferences",
                style: TextStyle(color: Colors.grey, fontSize: 19),
              ),
              const SizedBox(height: 20),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (selectedPreferences.isNotEmpty)
                    ...selectedPreferences.map(
                      (e) => _buildTag(
                        e,
                        selected: true,
                        onTap: () {
                          setState(() {
                            allPreferences.add(e);
                            selectedPreferences.remove(e);
                          });
                        },
                      ),
                    ),
                  ...allPreferences.map(
                    (e) => _buildTag(
                      e,
                      selected: false,
                      onTap: () {
                        setState(() {
                          selectedPreferences.add(e);
                          allPreferences.remove(e);
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Text(
                "Allergens to Avoid",
                style: TextStyle(color: Colors.grey, fontSize: 19),
              ),
              const SizedBox(height: 20),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (selectedAllergens.isNotEmpty)
                    ...selectedAllergens.map(
                      (e) => _buildTag(
                        e,
                        selected: true,
                        color: AppColors.red,
                        onTap: () {
                          setState(() {
                            allAllergens.add(e);
                            selectedAllergens.remove(e);
                          });
                        },
                      ),
                    ),
                  ...allAllergens.map(
                    (e) => _buildTag(
                      e,
                      selected: false,
                      onTap: () {
                        setState(() {
                          selectedAllergens.add(e);
                          allAllergens.remove(e);
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Custom Allergen Field
              Row(
                children: [
                  Expanded(
                    child: EditText(
                      hint: 'Add custom allergen...',
                      controller: customAllergenController,
                      labelStyle: 14.txtMediumWhite,
                      hintStyle: 14.txtMediumgrey,
                      inputType: TextInputType.text,
                      filledColor: Colors.grey.withOpacity(0.2),
                      borderColor: Colors.transparent,
                      textStyle: 14.txtMediumWhite,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (customAllergenController.text.isNotEmpty) {
                        selectedAllergens.add(customAllergenController.text);
                        customAllergenController.clear();
                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C2C2E),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Add"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(
    String text, {
    bool selected = false,
    Color color = AppColors.green,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? color.withOpacity(0.3) : AppColors.greyLite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: selected ? color : AppColors.greyLite),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!selected)
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: Icon(
                  LucideIcons.plus,
                  color: selected ? color : Colors.grey,
                  size: 16,
                ),
              ),
            Text(
              text,
              style: TextStyle(
                color: selected ? color : Colors.grey,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (selected)
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Icon(LucideIcons.x, color: Colors.white, size: 16),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> getData() async {


    nameController.text = homeController.profileModel.value.name ?? "";
    displayNameController.text =
        homeController.profileModel.value.displayName ?? "";
    bioController.text = homeController.profileModel.value.bio ?? "";

    selectedPreferences =
        homeController.profileModel.value.dietaryPreferences ?? [];
    selectedAllergens = homeController.profileModel.value.allergies ?? [];

    final userPreferences =
        homeController.profileModel.value.dietaryPreferences ?? [];
    final userAllergens = homeController.profileModel.value.allergies ?? [];

    Future.delayed(Duration(milliseconds: 100), () {
      allPreferences =
          homeController.dietaryPreferencesModel.dietaryPreferences ?? [];
      allAllergens = homeController.allergensModel.allergens ?? [];
      setState(() {});
    });

    // Create a new filtered list excluding user preferences
    final availablePreferences = allPreferences
        .where((preference) => !userPreferences.contains(preference))
        .toList();

    allPreferences = availablePreferences;

    // Create a new filtered list excluding user preferences
    final availableAllergens = allAllergens
        .where((preference) => !userAllergens.contains(preference))
        .toList();

    allAllergens = availableAllergens;

    await homeController.getProfile();
    setState(() {

    });

  }
}
