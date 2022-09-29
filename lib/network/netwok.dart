import 'package:get/get_connect/connect.dart';

import '../model/data.dart';

class Network extends GetConnect {



  Future<Data?> getData() async {
    var response = await get(
        'https://www.jsonkeeper.com/b/2W1I'
    );


    if (response.statusCode == 200) {

      var jsonString = response.body;
      print(jsonString.toString());
      return Data.fromJson(jsonString);

    } else {
      return null;
    }
  }
}