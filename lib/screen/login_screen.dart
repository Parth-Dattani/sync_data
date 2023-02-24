import 'dart:io';
// import 'package:custom/homepage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';
import '../controller/controller.dart';
import '../widgets/validator.dart';
import '../widgets/widget.dart';
import 'screen.dart';

class LoginScreen extends GetView<LoginController> {


  static const pageId = '/Login';
  final login = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final LoginController controller = Get.find<LoginController>();

  // var eyeClosed = true.obs;
  @override

  ///Future<LoginData>? login_;

  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          color: Colors.deepPurple,
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 40, left: 350)),
                    Image.asset(
                      'assets/images/logo2.png',

                      height: 100,
                    ),
                    SizedBox(height: 20),
                    const Text(
                      "ECORP",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.8,
                      // height: MediaQuery.of(context).size.height*0.4,
                      //height: 320,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),

                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          customTextField(
                              controller: emailController,
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                            validatorr: Validator.isPassword,
                            badValidationText: 'password_validator',
                              // validator: (value){
                              //   if(value!.isEmpty){
                              //     return "enter email";
                              //   }
                              // },
                             obscureText: false),
                          // TextFormField(
                          //   controller: emailController,
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     filled: true,
                          //     fillColor: Colors.black12,
                          //     hintText: "Email",
                          //     prefixIcon: Icon(Icons.email_outlined),
                          //   ),
                          // ),
                          SizedBox(height: 20),

                          Obx(()=>
                              customTextField(controller: controller.passwordTextController,
                              hintText: "Password",
                              prefixIcon:  Icon(Icons.lock),
                            validatorr: Validator.isPassword,
                            badValidationText: 'password_validator',
                            //   validator: (value){
                            // if(value!.isEmpty){
                            //     return "enter password";
                            // }},
                            obscureText: controller.hidePassword.value,
                            suffixIcon: IconButton(
                              icon: controller.hidePassword.value ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                controller.hidePassword.value = !controller.hidePassword.value;
                              },
                            ),
                          ),
                          ),



                      //
                      // Obx(() => TextFormField(
                      //   controller: passwordController,
                      //   obscureText: controller.hidePassword.value,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
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
                      //

                          SizedBox(height: 20),

                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),

                          Padding(padding: EdgeInsets.all(10)),
                          Container(
                            width: 150,
                            height: 50,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 20),
                              ),
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              onPressed: () {

                                // loginUser(emailController.text, passwordController.text);

                              },
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Container(
                            width: 210,
                            child: Center(
                              child: Row(
                                children: [
                                  const Text("Not Have Account?"),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                         Get.offAndToNamed(SignupScreen.pageId);
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             SignupScreen()));
                                        },
                                        child: Text("SignUp")),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // Text("SIGNUP", style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent), ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  doFormLogin() async {
    // if (this.login.currentState!.validate()) {

      controller.doLogin(emailController.text, passwordController.text);
    //}
  }
}
