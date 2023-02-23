import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_data/controller/controller.dart';
import 'package:sync_data/widgets/common_text_field.dart';
import '../Database/dbhelper.dart';
import '../Model/model_class.dart';
import 'home_screen.dart';

class AddDataScreen extends GetView<AddDataController> {
  static const pageId = '/AddDataScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: const Text("Task Data"),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(HomeScreen.pageId);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Display()));
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.myForm,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.isUpdate.value ? "Update Task" : "Add Data",
                style: TextStyle(
                    fontSize: (35),
                    color: Colors.indigo.shade800,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.fNameController,
                      decoration: InputDecoration(
                        hintText: "FirstName",
                        prefixIcon: const Icon(Icons.person,
                            color: Colors.deepPurpleAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter first Name';
                        }
                        return null;
                      },
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: CommonTextFormField(
                    controller: controller.lNameController,
                    hintText: "LastName",
                    prefixIcon: const Icon(Icons.person,
                        color: Colors.deepPurpleAccent),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter last Name';
                      }
                      return null;
                    },
                  ))
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: CommonTextFormField(
                    hintText: "Organization",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter Organization';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.cabin,
                      color: Colors.deepPurpleAccent,
                    ),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: CommonTextFormField(
                    hintText: "Organization",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter Organization';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.cabin,
                      color: Colors.deepPurpleAccent,
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 20),
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
                    if (controller.myForm.currentState!.validate() &&
                        !controller.isUpdate.value)
                      {
                        print("ADD"),
                        controller.myForm.currentState?.save(),
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Row(
                        //     children: const <Widget>[
                        //       CircularProgressIndicator(),
                        //       SizedBox(
                        //         width: 5,
                        //       ),
                        //       Text("  Data Added...")
                        //     ],
                        //   ),
                        //   duration: const Duration(milliseconds: 5000),
                        // )),
                        DatabaseHandler()
                            .add(DataModel(
                          id: controller.uidFunction().toInt(),
                          firstName: controller.fNameController.text,
                          lastName: controller.lNameController.text,
                        ))
                            .whenComplete(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Container(
                                    color: Colors.teal,
                                    child: const Text("Data Base Data!!")),
                                content: Row(
                                  children: const <Widget>[
                                    CircularProgressIndicator(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("  Data Added...")
                                  ],
                                ),
                              );
                            },
                          );

                          Future.delayed(const Duration(seconds: 3), () async {
                            //Get.offAndToNamed(HomeScreen.pageId);
                            Get.back();
                            Get.back();
                            DatabaseHandler().retriveAllTask();
                            //HomeController().getOffData();
                          });

                          //Get.back();
                          //DatabaseHandler().retriveAllTask();
                          //HomeController().getOffData();
                        })
                        //     .whenComplete(() => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Display()),
                        // )),
                      }
                    else if (controller.myForm.currentState!.validate())
                      {
                        print("Update"),
                        controller.data.value.firstName =
                            controller.fNameController.text,
                        controller.data.value.lastName =
                            controller.lNameController.text,
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            children: const <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Data Updated...")
                            ],
                          ),
                          duration: const Duration(milliseconds: 5000),
                        )),
                        DatabaseHandler()
                            .updateTask(controller.data.value)
                            .whenComplete(() {
                          DatabaseHandler().retriveAllTask();
                          Get.back();
                        })
                      },
                  },
                  child: Text(
                    controller.isUpdate.value ? "Update" : "Add",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
