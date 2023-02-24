import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customTextField extends StatefulWidget {
  customTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.prefixIcon,
      required this.validatorr,
      this.suffixIcon,
      required this.badValidationText,
      required this.obscureText})
      : super(key: key);

  var controller;
  String hintText;
  final prefixIcon, suffixIcon;
  String badValidationText;

  //bool suffixIcon = false;
  // final FormFieldValidator<String> validator;
  Function validatorr;
  bool obscureText = false;

  //container, image assets, stack, singlechildscrollviewq direction0

  @override
  _customTextFieldState createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        // suffixIcon: Icon(
        //   widget.suffixIcon ? Icons.visibility : null,
        // ),
        filled: true,
        fillColor: Colors.black12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
      //validator: widget.validator,
      // validator: (s) =>
      //     widget.validatorr(s) ? null : widget.badValidationText.tr,
      obscureText: widget.obscureText,
    );
  }
}
