import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momgreta/models/meal_detail_model.dart';
import 'package:momgreta/models/profile_model.dart';
import 'package:momgreta/screens/authentication/login_screen.dart';
import 'package:momgreta/screens/home_screen/home_meal_model.dart';
import 'package:momgreta/screens/home_screen/user_verification_model.dart';
import 'package:momgreta/screens/insights/attendance_model.dart';
import 'package:momgreta/utils/extensions/context_extensions.dart';

import '../../models/allergens_model.dart';
import '../../models/consumption_status_model.dart';
import '../../models/dietary_preferences_model.dart';
import '../../services/api_service.dart';
import '../../services/urls.dart';
import '../../utils/SharedPrefHelper/shared_pref_helper.dart';
import '../../utils/appUtils.dart';

class HomeController extends GetxController {

  DateTime dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime dateTimeToday = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime dateTimeYesterday = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day - 1,
  );

  Rx<ProfileModel> profileModel = ProfileModel().obs;
  Rx<ConsumptionStatusModel> statusModel = ConsumptionStatusModel().obs;

  RxList<Meals> meals = <Meals>[].obs;

  RxBool isLoading = true.obs;

  MealDetail mealDetail = MealDetail();

  DietaryPreferencesModel dietaryPreferencesModel = DietaryPreferencesModel();
  AllergensModel allergensModel = AllergensModel();
  final RxList<AttendanceItem> attendanceList = <AttendanceItem>[].obs;





  Future<void> getHistory() async {
    try {
      isLoading.value = true;

      final response =
      await ApiService.get(Urls.attendanceHistory, Urls.baseUrl);

      final model = AttendanceHistoryResponse.fromJson(response);

      attendanceList.assignAll(model.data?.data ?? []);
    } catch (e) {
      attendanceList.clear();
    } finally {
      isLoading.value = false;
    }
  }



// In your HomeController


// Add this variable at the top with other observables
  var userVerificationResponse = Rx<UserVerificationResponse?>(null);

  Future<bool> checkUser(BuildContext context, Map<String, dynamic> loginData) async {
    try {
      var response = await ApiService.post(
          Urls.checkUser,
          Urls.baseUrl,
          body: loginData
      );

      // response is already a Map<String, dynamic>, not an object with statusCode property
      if (response['statusCode'] != 200) {
        AppUtils.toastError(response['message'] ?? 'Verification failed');
        return false;
      } else {
        userVerificationResponse.value = UserVerificationResponse.fromJson(response);

        // Optional: Show success message
        // AppUtils.toast("User verified successfully");

        return true;
      }
    } catch (e) {
      // Toast already shown in _processResponse
      print("❌ API error caught: $e");
      return false;
    }
  }

  Future<bool> completeCheckIn(BuildContext context, Map<String, dynamic> checkInData) async {
    try {
      var response = await ApiService.post(
          Urls.checkIn, // Or your check-in endpoint
          Urls.baseUrl,
          body: checkInData
      );

      if (response['statusCode'] == 200||response['statusCode'] == 201) {
        await getHistory();

       // AppUtils.toast(response['message'] ?? 'Check-in successful');
        return true;
      } else {

        AppUtils.toastError(response['message'] ?? 'Check-in failed');
        return false;
        // Optionally refresh attendance history

      }
    } catch (e) {
      print("❌ API error caught: $e");
      return false;
    }
  }

  Future<void> getProfile() async {
    var response = await ApiService.get(Urls.profile, Urls.baseUrlProfile);

    profileModel.value = ProfileModel.fromJson(response);

    // Save in SharedPrefs

    // 🔥 Notify UI to refresh
    update();
  }


  Future<void> getDietary() async {
    var response = await ApiService.get(Urls.dietaryPreferences, Urls.baseUrlProfile);

    dietaryPreferencesModel = DietaryPreferencesModel.fromJson(response);

  }




  Future<void> getAllergens() async {
    var response = await ApiService.get(Urls.allergens, Urls.baseUrlProfile);

    allergensModel = AllergensModel.fromJson(response);

  }

  Future<void> getStatusHome(Map<String, String> mapData) async {
    /*var response = await ApiService.get(
      "/user/${SharedPrefHelper.profile!.user!.id}${Urls.consumption_status}",
      Urls.baseUrlAnalyze,
      queryParams: mapData,
    );

    statusModel.value = ConsumptionStatusModel.fromJson(response);

    // 🔥 Notify UI to refresh
    update();*/
  }

  Future<void> getUserMeals(Map<String, String> mapData) async {
    try {

      var response = await ApiService.get(
        "",
        Urls.baseUrlAnalyze,
        queryParams: mapData,
      );

      HomeMealModel homeMealModel = HomeMealModel.fromJson(response);
      meals.value = homeMealModel.meals ?? [];

      update(); // Notify UI after updating data
    } catch (e, stack) {
      print("❌ Error fetching user meals: $e");
      // Optionally log or show an error message
    } finally {
      isLoading.value = false; // Always stop loading, even if error occurs
    }
  }


  Future<void> getMealDetail(String mealId) async {
    // meals.clear();
    var response = await ApiService.get(
      "${Urls.mealDetail}/$mealId",
      Urls.baseUrlAnalyze,
    );

    mealDetail = MealDetail.fromJson(response);
    // 🔥 Notify UI to refresh
    update();
  }

  Future<void> deleteMeal(String? id) async {
    // meals.clear();
    var response = await ApiService.delete("/$id", Urls.baseUrlAnalyze);

    if (response != null && response['success'] == true) {
      // ✅ Remove the meal locally from the list
      meals.removeWhere((meal) => meal.id == id);

      // 🔥 Notify UI to refresh (GetX or similar state management)
      update();

      print('Meal with id $id deleted successfully');
    } else {
      print('Failed to delete meal: ${response.statusCode}');
    }
  }

  Future<bool> editMeal(String? id, Map<String, String> mealMap, Meals mealBack) async {
    // meals.clear();
    var response = await ApiService.put(
        "/$id", Urls.baseUrlAnalyze, body: mealMap);

    if (response != null && response['success'] == true) {
      // 🔹 Find the meal in your list
      final index = meals.indexWhere((meal) => meal.id == id);

      if (index != -1) {
        // ✅ Update overallPortions based on the main dish
        final meal = meals[index];
        for (var i = 0; i < meal.dishes!.length; i++) {
          if (meal.dishes![i].isMain == true) {
            meal.dishes![i].portion!.quantity =
                double.parse(mealMap["portion_quantity"]!);
            break;
          }
        }

        // ✅ Update meal locally (you can update portion, name, etc.)
        meals[index] = meal;
        mealBack = meal;

        return true;
        // 🔥 Notify UI
        update();

        print('Meal with id $id deleted successfully');
      }
      else {
        print('Failed to delete meal: ${response.statusCode}');
        return false;
      }
    }

    return false;
  }

  Future<bool> editProfile(Map<String, dynamic> editData) async {
    // meals.clear();
    var response = await ApiService.put(
        Urls.profile, Urls.baseUrlProfile, body: editData);

    if (response != null && response['success'] == true) {
      // 🔹 Find the meal in your list

    }

    return false;
  }

  Future<bool> deleteAccount(BuildContext context) async {
    // meals.clear();
    var response = await ApiService.delete(
        Urls.deleteAccount, Urls.baseUrlProfile,);

    if (response != null && response['success'] == true) {
      SharedPrefHelper.profile = null;
      context.pushAndClearNavigator(LoginPage());

    }

    return false;
  }
  Future<bool> logoutAccount(BuildContext context) async {
    // meals.clear();
    var response = await ApiService.post(
        Urls.logoutAccount, Urls.baseUrl,);

    if (response != null && response['success'] == true) {
      // SharedPrefHelper.profile = null;
      // context.pushAndClearNavigator(LoginPage());

    }

    return false;
  }

}
