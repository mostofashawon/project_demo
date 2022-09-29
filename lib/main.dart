import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project/controller/signup_controller.dart';
import 'package:project/widget/customText.dart';
import 'package:get/get.dart';
import 'package:project/widget/custom_edit_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    SignUpController controller = Get.put(SignUpController());

    List<String> genderList = ["Male","Female"];
    return Scaffold(
      body: Obx(() => Column(
        children: <Widget>[

          getCustomText("Sign Up",30.0),

          SizedBox(height: screenHeight * 0.030,),

          Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.065,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenHeight * 0.019,
                      right: screenHeight * 0.019,
                    ),
                    child: getCustomEditText(controller, 'Enter EmailAddress', 'email',Icons.email),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),

                // Padding(
                //   padding: EdgeInsets.only(
                //       left: screenHeight * 0.019,
                //       right: screenHeight * 0.019
                //   ),
                //   child: Container(
                //     height: screenHeight * 0.075,
                //     width: double.infinity,
                //     color: Colors.grey,
                //     child: Padding(
                //         padding: EdgeInsets.only(
                //             left: screenHeight * 0.019,
                //             right: screenHeight *0.019
                //         ),
                //         child:  DropdownButton(
                //
                //
                //           value: controller.dropdownvalue,
                //
                //
                //           icon:Icon(Icons.keyboard_arrow_down),
                //
                //
                //           items: controller.items.map((String items) {
                //             return DropdownMenuItem(
                //               value: items,
                //               child: Text(items),
                //             );
                //           }).toList(),
                //           onChanged: (newValue) {
                //             // controller.dropdownvalue.value = newValue.toString();
                //           },
                //         )
                //     ),
                //   ),
                // ),
                SizedBox(height: screenHeight * 0.015,),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenHeight * 0.019,
                      right: screenHeight * 0.019
                  ),
                  child: Container(
                    height: screenHeight * 0.075,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenHeight * 0.019,
                          ),
                          child: GestureDetector(
                            child: Icon(Icons.calendar_month),
                            onTap: (){
                              controller.chooseExpireDate();
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015,),
                        Padding(
                            padding: EdgeInsets.only(
                              left: screenHeight * 0.019,
                            ),
                            child: Obx(() =>
                                Text(
                                  controller.selectedDate.value.toString(),
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.020,
                                      color: Colors.black
                                  ),
                                ),
                            )
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015,),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenHeight * 0.019,
                    right: screenHeight * 0.019,
                  ),
                  child: getCustomEditText(controller, 'Enter password', 'pass',Icons.key),
                ),
                SizedBox(height: screenHeight * 0.035,),
                Padding(
                    padding: EdgeInsets.only(
                      left: screenHeight * 0.019,
                      right: screenHeight * 0.019,
                    ),
                    child: getCustomEditText(controller, 'Enter confirmPassword', 'pass',Icons.key),
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                ElevatedButton(
                    onPressed: () {
                      if(controller.password.value == controller.confirmPass.value ){

                      }

                      else {
                          Get.snackbar('Status', 'Validation Error');
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          ),

          Visibility(
              visible: false,
              child: Text(controller.selectedDate.value))

        ],
      )) ,
    );
  }
}
