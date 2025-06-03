import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/core/services/api_service.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/adminmain.dart';


class LoginController extends GetxController {
  // final AuthRepoImpl authenticationRepo = AuthRepoImpl();

  var isStayed = false.obs;
  var isObscured = true.obs;
  final String correctUsername = "admin";
  final String correctPassword = "12345";
  bool isloginloading = false;
  bool _islogin = false;
  bool get islogin => _islogin;

  bool _isauthchecking = false;
  bool get isauthchecking => _isauthchecking;

  void setpasswordvisibility() {
    isObscured.value = !isObscured.value;
  }

  var isLoading = false.obs;
  var isLoggedIn = false.obs;

  // Example login method
  Future<bool> login(String username, String password) async {
    isLoading.value = true;
    try {
      // Simulate API call

      var response = await ApiService(baseUrl: api).post(
        '/api/Accounts/login',
        headers: {'Content-Type': 'application/json'},
        body: {'userName': username, 'password': password},
      );

      log(response.toString());

      // Replace with real authentication logic
      if (response.statusCode == 200) {
        isLoggedIn.value = true;
        Get.to(AdminMainPage());
        return true;
      } else {
        isLoggedIn.value = false;
        return false;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    isLoggedIn.value = false;
  }

  // void logout() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.clear();
  //   checktoken();
  //   // Get.offAll(const LoginPage());
  // }

  // void validateAndLogin(
  //     BuildContext context, String username, String password) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();

  //   //get login api

  //   //  else if (username != correctUsername || password != correctPassword) {
  //   //   _showDialog("Login Failed", "Incorrect Username or Password.");
  //   // }

  //   showLoadingDialog(context: context);
  //   Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() async {
  //     //res = {"String":"int"} {1 - sucess,-1 - error,3 - catch exception}
  //     Map<String, User?> res =
  //         await authenticationRepo.loginUser(username, password);

  //     // set values to shared preferences is login is successfull
  //     if (res.entries.first.value != null) {
  //       _islogin = true;
  //       _currentUser = res.entries.first.value;
  //       update();
  //       Navigator.of(context).pop();
  //       if (_currentUser!.token != null) {
  //         pref.setString('token', _currentUser?.token ?? "");
  //       }

  //       showDialog(res.keys.first, "Welcome, ${_currentUser?.name} !");
  //     } else {
  //       Navigator.of(context).pop();

  //       showDialog("Log In Error!", res.keys.first);
  //     }

  //     //Demo Login Details

  //     // if (username == correctUsername && password == correctPassword) {
  //     //   _islogin = true;
  //     //   pref.setString('token', username);
  //     //   update();
  //     //   Navigator.of(context).pop();
  //     //   // authenticate();

  //     //   showDialog('Login Successfully', "Welcome, $username!");
  //     // } else {
  //     //   Navigator.of(context).pop();
  //     //   showDialog("Log In Error!", "d");
  //     // }
  //   });
  //   // Navigate to the next screen
  // }

  // void authenticate() {
  //   if (_islogin) {
  //     Get.offAll(() => const MainScreen());
  //   }
  // }

  // void checktoken() async {
  //   print("In Check User token");
  //   _isauthchecking = true;
  //   update();

  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (pref.containsKey('token')) {
  //     debugPrint("in check token: ");
  //     String token = pref.getString("token")!;
  //     debugPrint("in check token:$token");
  //     Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() async {
  //       //token api
  //       Map<String, User?> res = await authenticationRepo.checkUserToken(token);

  //       // set values to shared preferences is login is successfull
  //       if (res.entries.first.value != null) {
  //         debugPrint("Token Validate");
  //         _currentUser = res.entries.first.value;
  //         _islogin = true;
  //         update();
  //       } else {
  //         debugPrint("Token not Validate");
  //         _islogin = false;
  //         update();
  //       }
  //       _isauthchecking = false;
  //       update();
  //       log('trueeeee');
  //     });
  //   } else {
  //     Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() {
  //       debugPrint("No User token");
  //       _islogin = false;

  //       _isauthchecking = false;
  //       update();
  //       log('falsesssss');
  //     });
  //   }
  //   isloginloading = false;
  //   update();
  // }

  void showDialog(String title, String message) {
    print("Message: $message");
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("OK")),
        ],
      ),
    );
  }
}
