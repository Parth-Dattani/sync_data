import 'package:get/get.dart';

class Validator{
  static get badValidationText => null;


  static bool isUserName(String s){
    return s != null &&
        s.isNotEmpty &&
    GetUtils.isLengthGreaterOrEqual(GetUtils.removeAllWhitespace(s), 6);;

  }

  static bool isFirstName(String s){
    return s != null &&
        s.isNotEmpty ;

  }

  static bool isLastName(String s){
    return s != null &&
        s.isNotEmpty ;

  }

  static String? isEmail(email) {
    if (email.toString().trim().isEmpty) {
      return 'email_is_required'.tr;
    }
    return null;
  }

  // static bool isEmail(String email, String msg){
  //
  //   if (email!.isEmpty) {
  //         badValidationText: 'enter first name';
  //       }
  //       if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(email)) {
  //         badValidationText:  'Please a valid Email';
  //       }
  //       return badValidationText;
  //   // return s != null &&
  //   //        s.isNotEmpty ;
  // }

  static bool isPassword(String s){
    return s !=null &&s.isNotEmpty;
  }

  static bool isPhone(String s){
    return s !=null && s.isNotEmpty;
  }

}