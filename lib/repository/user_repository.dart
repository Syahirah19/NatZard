import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natzard/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//repository == connection between system & firestore
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    //if user tak exist = cloudfirestore akan create kan
    await _db.collection("User").add(user.toJson()).whenComplete(() {
      Get.snackbar("Success", "Your account has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
      // ignore: body_might_complete_normally_catch_error
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  authUser(email, password) async {
    QuerySnapshot<Map<String, dynamic>> document = await _db
        .collection("User")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .get();

    if (document.docs.isNotEmpty) {
      Get.snackbar("Success", "Successfully Login.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);

      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('isLoged', true);

      return true;
    } else {
      // print('error');
      Get.snackbar("Error", "Incorrect email or password. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);

      return false;
    }
  }
}
