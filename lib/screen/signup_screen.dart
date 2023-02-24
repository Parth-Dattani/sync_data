import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import '../widgets/validator.dart';
import '../widgets/widget.dart';
import 'screen.dart';

class SignupScreen extends GetView<SignupController> {
  static const pageId = '/Signup';



  SignupScreen({super.key});

  //final SignupController controller = Get.find<SignupController>();

  @override

  ///  Future<LoginData>? signup_;
  Widget build(BuildContext context) {
    String userName, firstName, lastName, email, phone, role;

    return Scaffold(
      appBar: AppBar(
        leading:  const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text("SignUp", style: TextStyle(color: Colors.green,),),
        elevation: 0,
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Form(
                key: controller.signup,
                child: Column(
                  children: [
                    Text(
                      "Looks like you are new here,let's create a new account",
                      style: TextStyle(
                          fontSize: (35),
                          color: Colors.indigo.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    customTextField(
                      controller: controller.userNameController,
                      hintText: "User Name",
                      prefixIcon:
                      const Icon(Icons.person, color: Colors.deepPurpleAccent),
                      //suffixIcon: false,
                      suffixIcon: const Icon(Icons.start, color: Colors.transparent,),
                      validatorr: Validator.isPassword,
                      badValidationText: 'enter user name',
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "enter user name";
                      //   } else if (value.isEmpty) {
                      //     return "user name not enterd";
                      //   }
                      //   return null;
                      // },
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),

                    customTextField(
                      controller: controller.firstNameController,
                      hintText: "First Name",
                      prefixIcon:
                      const Icon(Icons.person, color: Colors.deepPurpleAccent),
                      //suffixIcon: false,
                      suffixIcon: const Icon(Icons.start, color: Colors.transparent,),
                      validatorr: Validator.isPassword,
                      badValidationText: 'enter first name',
                      // validator: (firstName) {
                      //   if (firstName!.isEmpty) {
                      //     return "enter first name";
                      //   }
                      //   // else if (firstName.length < 6 ||
                      //   //     firstName.length > 20) {
                      //   //   return "name should have valid length";
                      //   // }
                      //   return null;
                      // },
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    customTextField(
                      controller: controller.lastNameController,
                      hintText: "Last Name",
                      prefixIcon:
                      const Icon(Icons.person, color: Colors.deepPurpleAccent),
                      suffixIcon: Icon(Icons.start, color: Colors.transparent,),
                      //suffixIcon: false,
                      validatorr: Validator.isPassword,
                      badValidationText: 'password_validator',
                      // validator: (lastName) {
                      //   if (lastName!.isEmpty) {
                      //     return "please enter last name";
                      //   }
                      //   // if (lastName.length < 6 || lastName.length > 20) {
                      //   //   return "sorry name Maximum length 20";
                      //   // }
                      //   return null;
                      // },
                      obscureText: false,
                    ),
                    const SizedBox(height: 15),
                    customTextField(
                      controller: controller.emailController,
                      hintText: "mayurtheonetech5@gmail.com",
                      prefixIcon:
                      const Icon(Icons.mail, color: Colors.deepPurpleAccent),
                      suffixIcon: const Icon(Icons.start, color: Colors.transparent,),
                      //suffixIcon: false,
                      validatorr: Validator.isEmail,
                      badValidationText: 'Validator.isEmail',
                      // validator: (email) {
                      //   if (email!.isEmpty) {
                      //     return "enter valid email address";
                      //   }
                      //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      //       .hasMatch(email)) {
                      //     return 'Please a valid Email';
                      //   }
                      // },
                      obscureText: false,
                    ),
                    const SizedBox(height: 15),

                    // Obx(() => TextFormField(
                    //   controller: passwordController,
                    //   obscureText: controller.hidePassword.value,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(25.0),
                    //       borderSide: BorderSide(
                    //         color: Colors.white,
                    //         width: 2.0,
                    //       ),
                    //     ),
                    //     filled: true,
                    //     fillColor: Colors.black12,
                    //     hintText: "Password",
                    //     prefixIcon: Icon(Icons.lock),
                    //     suffixIcon: IconButton(
                    //       icon: controller.hidePassword.value ? Icon(Icons.visibility_off)
                    //           : Icon(Icons.visibility),
                    //       onPressed: () {
                    //         controller.hidePassword.value = !controller.hidePassword.value;
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // ),

                    Obx(() => customTextField(
                      controller: controller.passwordController,
                      hintText: "password",
                      prefixIcon:
                      const Icon(Icons.lock, color: Colors.deepPurpleAccent),
                      suffixIcon: IconButton(
                        icon: controller.hidePassword.value ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          controller.hidePassword.value = !controller.hidePassword.value;
                        },
                      ),
                      //suffixIcon: true,
                      validatorr: Validator.isPassword,
                      badValidationText: 'password_validator',
                      //     (password) {
                      //   if (password!.isEmpty) {
                      //     return "enter password";
                      //   }
                      // },
                      obscureText: controller.hidePassword.value,
                    ),),
                    const SizedBox(height: 15),
                    customTextField(
                      controller: controller.phoneController,
                      hintText: "phone No.",
                      prefixIcon:
                      const Icon(Icons.phone, color: Colors.deepPurpleAccent),
                      // suffixIcon: false,
                      suffixIcon: const Icon(Icons.start, color: Colors.transparent,),
                      validatorr: Validator.isPassword,
                      badValidationText: 'enter phone number',
                      //     (value) {
                      //   if (value!.isEmpty) {
                      //     return "enter phone number";
                      //   }
                      // },
                      obscureText: false,
                    ),
                    const SizedBox(height: 15),
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 340,
                      height: 55,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: () => {
                            if (controller.signup.currentState!.validate())
                              {
                                controller.registerAPI(),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginScreen()),
                                ),
                              }
                            else {
                                print("UnSuccessfull"),
                              }
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(fontSize: 20),
                          )

                      ),
                    ),
                    // SizedBox(height: 50),
                    SizedBox(
                      height: 120,
                      width: 210,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, bottom: 40),
                          child: Row(
                            children: [
                              Text("Have Account?", ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: const Text("Login"))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  doFormSignup()async {
    //controller.doSignup(userNameController.text, firstNameController.text, lastNameController.text, emailController.text, passwordController.text, phoneController.text);
  }
}
