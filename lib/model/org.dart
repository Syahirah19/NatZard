import 'package:cloud_firestore/cloud_firestore.dart';

class OrgModel {
  final String? id;
  final String orgName;
  final String orgAddress;
  final String orgEmail;
  final String? orgPhone;
  final String orgImg;
  final String? orgPix;
  final String orgDescription;
  final String? orgBankName;
  final String? orgBankAccount;

  const OrgModel({
    this.id,
    required this.orgName,
    required this.orgAddress,
    required this.orgEmail,
    this.orgPhone,
    required this.orgImg,
    required this.orgDescription,
    this.orgPix,
    this.orgBankName,
    this.orgBankAccount,
  });

  toJson() {
    return {
      "Name": orgName,
      'address': orgAddress,
      'email': orgEmail,
      'Phone': orgPhone,
      'imgUrl': orgImg,
      'description': orgDescription,
    };
  }

  factory OrgModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return OrgModel(
      id: document.id,
      orgName: data['Name'],
      orgAddress: data["Address"],
      orgEmail: data["Email"],
      orgDescription: data["Description"],
      orgImg: data["Img"],
    );
  }
}
