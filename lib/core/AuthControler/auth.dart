import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:convert';
import 'package:lifer_food/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/screens/bottom_navigation/curved_bottom_navigation.dart';

class AuthService extends GetxController {
  final nameControler = TextEditingController();
  final lastnameControler = TextEditingController();
  final passwordControler = TextEditingController();
  final emailControler = TextEditingController();
  final phonenumberControler = TextEditingController();
  PhoneNumber selectedcodenumber = PhoneNumber();
  String userid = '';
  RxBool isLoading = false.obs; // Track loading state
  Future<void> signUp() async {
    final String phonecont = phonenumberControler.text;
    try {
      isLoading.value = true;
      update();
      var data = {
        "role_id": 2,
        "first_name": nameControler.text,
        "last_name": lastnameControler.text,
        "email": emailControler.text,
        "password": passwordControler.text,
        "contact_no": "$selectedcodenumber$phonecont"
      };
      var response = await http.post(
        Uri.parse(signup),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      final result = json.decode(response.body);
      if (result['success'] == true) {
        userid = result['id']; // Store user id
        // Save userid to SharedPreferences
        await _saveUserIdToPrefs(userid);
        Get.snackbar('Success', 'Registration successful');
        Get.offAll(CurvedNavigationbar());
      } else {
        Get.snackbar('Error', result['message']);
      }
      Get.snackbar('Error', response.body.toString());
      print(response.body.toString());
      print(userid);
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  // Method to save userid to SharedPreferences
  Future<void> _saveUserIdToPrefs(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  // Method to retrieve userid from SharedPreferences
  Future<String?> getUserIdFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<void> signIn() async {
    try {
      isLoading.value =
          true; // Set loading to true while request is in progress
      update(); // Update the UI to reflect loading state
      final response = await http.post(Uri.parse(login), body: {
        "email": emailControler.text,
        "password": passwordControler.text
      });
      final result = json.decode(response.body);
      if (result['success'] == true) {
        Get.snackbar('Success', 'Login successful');
      } else {
        Get.snackbar('Error', result['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value =
          false; // Set loading back to false after request completes
      update(); // Update the UI to reflect loading state
    }
  }
}
