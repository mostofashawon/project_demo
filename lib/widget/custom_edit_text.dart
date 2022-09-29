

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/controller/signup_controller.dart';

Widget getCustomEditText(
    SignUpController controller,
    String labelText,
    String type,
    IconData icon
    ){

  return TextFormField(
    obscureText: true,
    cursorColor: Colors.black,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    ),
    controller: controller.passwordController,
    validator: (value) {
      return type == 'email' ? controller.validateEmail(value!) :
            type == "pass" ? controller.validatePassword(value!) :
                        controller.validateConfirmPassword(value!);
    },
    onSaved: (value) {
      type == 'email' ? controller.email = value! :
      type == "pass" ? controller.password.value = value! :
      controller.confirmPass.value = value!;
    },
  );
}