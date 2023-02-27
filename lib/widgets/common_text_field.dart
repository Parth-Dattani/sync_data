import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class CommonTextField extends StatefulWidget {
//
//
//   CommonTextField(
//       {Key? key,
//         required this.controller,
//         required this.hintText,
//         required this.prefixIcon,
//         required this.validatorr,
//         this.suffixIcon,
//         required this.badValidationText,
//         required this.obscureText})
//       : super(key: key);
//
//   var controller;
//   String hintText;
//   final prefixIcon,suffixIcon;
//   String badValidationText;
//
//   //bool suffixIcon = false;
//   // final FormFieldValidator<String> validator;
//   Function validatorr;
//   bool obscureText = false;
//   //container, image assets, stack, singlechildscrollviewq direction0
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         prefixIcon: widget.prefixIcon,
//         suffixIcon: widget.suffixIcon,
//         // suffixIcon: Icon(
//         //   widget.suffixIcon ? Icons.visibility : null,
//         // ),
//         filled: true,
//         fillColor: Colors.black12,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25.0),
//           borderSide: BorderSide(
//             color: Colors.white,
//             width: 2.0,
//           ),
//         ),
//       ),
//       // validator: widget.validator,
//       validator: (s) => widget.validatorr(s) ? null : widget.badValidationText.tr,
//       obscureText: widget.obscureText,
//     );
//   }
// }


class CommonTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final String? badValidationText;
  final bool isObscure;
  final TextStyle? hintTextStyle;
  final double? borderRadius;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

   CommonTextFormField({
     Key? key,
     this.prefixIcon,
     this.suffixIcon,
     this.controller,
     this.hintText,
     this.isObscure = false,
     this.validator,
     this.hintTextStyle,
     this.borderRadius,
     this.badValidationText, required validatorr
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // suffixIcon: Icon(
        //   widget.suffixIcon ? Icons.visibility : null,
        // ),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      validator: validator,
      // validator: widget.validator,
     // validator: (s) => widget.validatorr(s) ? null : widget.badValidationText.tr,
      obscureText: isObscure,
    );
  }
}

