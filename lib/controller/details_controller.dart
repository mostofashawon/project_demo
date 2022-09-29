

import 'package:get/get.dart';
import 'package:project/model/data.dart';
import 'package:project/network/netwok.dart';

class DetailsController extends GetxController {
  var isLoading = true.obs;
  var data = Data().obs;


  @override
  void onInit() {
    fetchData();
    super.onInit();
  }


  Future<void> fetchData() async {
    try{
      isLoading(true);
      var datas = await Network().getData();
      if ( datas!= null) {
        data.value = datas;

      }

      isLoading.value = false;
    }
    catch(e){

    }

  }
}