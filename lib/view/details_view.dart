import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/controller/details_controller.dart';
import 'package:project/widget/customText.dart';

class DetailScreen extends StatelessWidget {

  DetailsController controller = Get.put(DetailsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(() => controller.isLoading.value == true ?
        Center(
          child: CircularProgressIndicator(),
        ) : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300.0,
              width: double.maxFinite,
              child: FadeInImage(
                fit: BoxFit.fill,
                image: NetworkImage(

                    controller.data.value.data![0].imagePath.toString()
                ),
                placeholder: AssetImage(
                    'assets/images/loading.png'
                ),

              ),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding:  EdgeInsets.only(left: 15.0),
              child: getCustomText(controller.data.value.data![0].title.toString(), 20.0),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding:  EdgeInsets.only(left: 15.0),
              child: getCustomText(controller.data.value.data![0].details.toString() +
                  controller.data.value.data![0].details.toString() + controller.data.value.data![0].details.toString(), 10.0),
            ),

          ],
        )
        ),
      ),
    );
  }
}
