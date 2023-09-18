import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:natzard/model/org.dart';

class OrgRepository extends GetxController {
  static OrgRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrgModel>> allItem() async {
    final snapshot = await _db.collection("Org").get();
    final itemData =
        snapshot.docs.map((e) => OrgModel.fromSnapshot(e)).toList();
    // print(itemData);
    return itemData;
  }
}
