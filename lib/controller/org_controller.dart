import 'package:get/get.dart';
import 'package:natzard/model/org.dart';
import 'package:natzard/repository/ngo_repository.dart';

class OrgController extends GetxController {
  static OrgController get instance => Get.find();

  final _itemRepo = Get.put(OrgRepository());

  Future<List<OrgModel>> getAllItem() async {
    return await _itemRepo.allItem();
  }
}
