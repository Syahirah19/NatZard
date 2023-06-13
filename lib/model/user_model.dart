import 'package:cloud_firestore/cloud_firestore.dart';

//attribute yang nak masuk dalam database
class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final String? bankName; //check balik - string tanda soal - tak required
  final String? bankAccount; //check balik

  const UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.phoneNo,
      required this.password,
      this.bankName,
      this.bankAccount});

  toJson() {
    //nak hantar ke database guna format json (so lagi senang takyah hantar satu satu)
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "BankName": bankName,
      "BankAccount": bankAccount,
    };
  }

//nak tarikh balik data
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      phoneNo: data["Phone"],
      password: data["Password"],
      bankName: data["BankName"],
      bankAccount: data["BankAccount"],
    );
  }
}
