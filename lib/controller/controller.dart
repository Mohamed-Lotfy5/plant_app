
import 'package:get/get.dart';

import '../model/fake_data(plant).dart';
import '../model/model.dart';

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
