import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natzard/System/system_screen.dart';

import '../model/user_model.dart';
import '../repository/user_repository.dart';

class LoginSignUpController extends GetxController {
  late BuildContext context;

  LoginSignUpController({required this.context});

  static LoginSignUpController get instance => Get.find();

  // Login
  final emailLogin = TextEditingController();
  final passwordLogin = TextEditingController();

  // SignUp
  final emailSignup = TextEditingController();
  final fullName = TextEditingController();
  final phoneNum = TextEditingController();
  final passwordSignup = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SystemScreen();
    }));
  }

  Future<void> authUser(String email, String password) async {
    // print("$email|$password");
    bool auth = await userRepo.authUser(email, password);
    if (auth) {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const SystemScreen();
      }));
    }
  }
}
