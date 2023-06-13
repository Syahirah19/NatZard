import 'package:cloud_firestore/cloud_firestore.dart';
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
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  authUser(email, password) async {
    QuerySnapshot<Map<String, dynamic>> document = await FirebaseFirestore
        .instance
        .collection("User")
        .where("Email", isEqualTo: email)
        .where("Password", isEqualTo: password)
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
      Get.snackbar("Error", "Incorrect email or password. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);

      return false;
    }
  }
}
