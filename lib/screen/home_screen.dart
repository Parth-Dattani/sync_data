import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:sync_data/Model/model_class.dart';
import 'package:sync_data/controller/controller.dart';
import 'package:sync_data/screen/add_data.dart';
import 'package:sync_data/screen/user.dart';
import 'dart:math';
import '../Database/dbhelper.dart';

class HomeScreen extends GetView<HomeController> {
  static const pageId = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sync Data "),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print("Data Syncing from Internet");
                controller.getData();
              },
              icon: const Icon(Icons.download),
            ),
            IconButton(
              onPressed: () {
                print("Data Syncing from Internet");
                controller.getProductData();
              },
              icon: const Icon(Icons.abc),
            ),
            IconButton(
              onPressed: () {
                print("Data Syncing from Internet");
                controller.getUserData();
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        body: Obx(
            ()=> OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                controller.connected.value =
                    connectivity != ConnectivityResult.none;
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    child,
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      height: 32.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.slowMiddle,
                        color: controller.connected.value
                            ? const Color(0xFF00EE44)
                            : Color(0xFFEE4400),
                        child: controller.connected.value
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    "ONLINE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    "OFFLINE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                    height: 12.0,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ListView.builder(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      /* gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 8,
                                childAspectRatio:
                                    Get.size.width / (Get.size.height / 1.4),
                              ),*/
                      itemCount: controller.uModel.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                // color: (index % 2) == 0
                                //     ? Colors.lightBlueAccent
                                //     : Colors.tealAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.teal,
                                          border: Border.all(width: 2)),
                                      child: Text(
                                        controller.uModel[index].id.toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            controller.uModel[index].name
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            controller.uModel[index].email
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.toNamed(AddDataScreen.pageId,
                                                arguments: {
                                                  "isUpdate": true,
                                                  "data": controller.uModel[index]
                                                });

                                            // DatabaseHandler().deleteTask(
                                            //     snapshot.data![index]
                                            //         .id!
                                            //         .toInt());
                                            // setState(() {
                                            //   //handler.deleteUser(p);
                                            // });
                                            // getAllTask();
                                          },
                                          icon: const Icon(
                                            Icons.edit_sharp,
                                            color: Colors.white,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            print(
                                                "Idd:  ${controller.uModel[index].id}");
                                            //   print(snapshot.data![index].id);
                                            DatabaseHandler().deleteUser(
                                                controller.uModel[index].id!.toInt());
                                            //     snapshot.data![index]
                                            //         .id!
                                            //         .toInt());
                                            // setState(() {
                                            //   //handler.deleteUser(p);
                                            // });
                                            controller.getOffData();
                                          },
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),

                                  // IconButton(
                                  //     onPressed: () {
                                  //         //print(snapshot.data![index].id);
                                  //       handler.deleteTask(
                                  //           snapshot
                                  //               .data![index]
                                  //               .id!
                                  //               .toInt());
                                  //       //setState(() {
                                  //       DatabaseHandler.D(p);
                                  //       //});
                                  //       /getAllTask();
                                  //     },
                                  //     icon: const Icon(
                                  //       Icons.delete_forever,
                                  //       color: Colors.red,
                                  //     )),

                                  /*        Padding(
                                                                padding: const EdgeInsets.only(
                                                                    left: 35.0),
                                                                child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                        onPressed: () async {
                                                                          // Navigator.push(
                                                                          //   context,
                                                                          //   MaterialPageRoute(
                                                                          //       builder:
                                                                          //           (context) =>
                                                                          //           User(
                                                                          //             isUpdate:
                                                                          //             true,
                                                                          //             id: snapshot
                                                                          //                 .data![index]
                                                                          //                 .id!,
                                                                          //             title: snapshot
                                                                          //                 .data![index]
                                                                          //                 .title,
                                                                          //             description: snapshot
                                                                          //                 .data![index]
                                                                          //                 .description,
                                                                          //           )
                                                                          //   ),
                                                                          // );
                                                                        },
                                                                        icon: const Icon(
                                                                          Icons.edit_sharp,
                                                                          color: Colors.indigo,
                                                                        )),
                                                                    IconButton(
                                                                        onPressed: () {
                                                                          //   print(snapshot.data![index].id);
                                                                          // handler.deleteTask(
                                                                          //     snapshot
                                                                          //         .data![index]
                                                                          //         .id!
                                                                          //         .toInt());
                                                                          //setState(() {
                                                                            //handler.deleteUser(p);
                                                                         // });
                                                                          ///getAllTask();
                                                                        },
                                                                        icon: const Icon(
                                                                          Icons.delete_forever,
                                                                          color: Colors.red,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),*/
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AddDataScreen.pageId, arguments: {
              "isUpdate": false,
            });
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => User(
            //         id: 0,
            //         title: '',
            //         description: '',
            //         date: '',
            //         isUpdate: false,
            //         status: '',
            //       )),
            // );
            print("data added");
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      );
  }
}
