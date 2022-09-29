

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/view/details_view.dart';

class SignUpController extends GetxController {


  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController, confirmPassController;


  var email = '';
  var password = ''.obs;
  var confirmPass = ''.obs;
  var chossenValue = "".obs;
  var selectedDate = "Date of Birth".obs;

  var quantityKg = '1 kg'.obs;


  var dropdownvalue = 'Item 1'.obs;

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];




  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
    //checkLogin();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }


  String? validateEmail(String value) {
    if (value.length < 1 ) {
      return "Provide email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }

    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }


  Future<void> checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    else{
      loginFormKey.currentState!.save();
      Get.to(DetailScreen());
    }

  }

  chooseExpireDate() async{

    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2130),
        builder: (context,widget) => Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.dark(
                surface: Colors.black
            ),
            dialogBackgroundColor: Colors.green.shade200,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary:  Colors.black, // button text color
              ),
            ),
          ),
          child: widget!,
        )
    );
    selectedDate.value = pickedDate.toString().substring(0,10);

  }


}