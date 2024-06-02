import 'package:flutter_application_1/model/fake_data(plant).dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:get/get.dart';

class PlantsController extends GetxController {
  plantmodel model = plantmodel.fromJson(fakeData);
  List<Data?>? CartList = [];
  addToCart(Data? plantmodel) {
    CartList!.contains(plantmodel) ? null : CartList?.add(plantmodel);
    update();
  }

  icreament(Data? plantmodel) {
    plantmodel!.quantity = plantmodel.quantity! + 1;
    update();
  }

 decreament(Data? plantmodel) {
    plantmodel!.quantity = plantmodel.quantity! - 1;
    update();
  }


}
