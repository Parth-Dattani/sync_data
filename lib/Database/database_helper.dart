// import 'package:custom/ModelClass.dart';
// import 'package:custom/database_helper.dart';
// import 'package:custom/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//
// import 'ModelClass.dart';
// import 'database_helper.dart';
//
// class Display extends StatefulWidget {
//   const Display({Key? key}) : super(key: key);
//
//   @override
//   State<Display> createState() => _DisplayState();
// }
//
// class _DisplayState extends State<Display> {
//   late DatabaseHandler handler;
//
//   Future<List<User>>? user;
//
//   @override
//   void initState() {
//     super.initState();
//     handler = DatabaseHandler();
//     handler.initializeDB().whenComplete(() async {
//       setState(() {
//         user = getList();
//       });
//     });
//   }
//
//   Future<List<User>> getList() async {
//     return await handler.retrieveUsers();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         leading: const Icon(Icons.table_rows_sharp),
//         actions: [
//           Row(
//             children: [
//               const Text("Add Task"),
//               IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => SignUp(
//                             isUpdate: false,
//                             id: 0,
//                             email: "",
//                             firstName: "",
//                             lastName: "",
//                             city: "",
//                             phone: "",
//                           )),
//                     );
//                   },
//                   icon: const Icon(
//                     Icons.add,
//                     size: 30,
//                   )),
//             ],
//           )
//         ],
//         title: const Text("Task List"),
//       ),
//       body: FutureBuilder(
//         future: handler.retrieveUsers(),
//         builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
//           if (snapshot.data == null || snapshot.data!.isEmpty) {
//             return const Center(child: Text("no data found"));
//           }
//           if (snapshot.hasData) {
//             return SingleChildScrollView(
//
//               child: AnimationLimiter(
//
//                 child:
//                 Column(
//                   children: [
//                     SizedBox(height: 10,),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25.0),
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(19, 1, 11, 1),
//                           ),
//                         ),
//                         hintText: "Search...",
//                         suffixIcon: Icon(Icons.search),
//                         filled: true,
//                         fillColor: Colors.black12,
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//
//                     GridView.builder(
//                       padding: const EdgeInsets.only(left: 20, right: 20),
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 20,
//                         mainAxisSpacing: 8,
//                         childAspectRatio: 0.7,
//                       ),
//                       itemCount: snapshot.data?.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: (index % 2) == 0
//                               ? const EdgeInsets.only(bottom: 15)
//                               : const EdgeInsets.only(top: 15),
//                           child: AnimationConfiguration.staggeredGrid(
//                             position: index,
//                             columnCount: 10,
//                             child: SlideAnimation(
//                               horizontalOffset: 430,
//                               verticalOffset: 400,
//                               duration: Duration(milliseconds: 2000),
//                               child: Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Container(
//                                   child: Column(
//                                     children: [
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//
//                                         // margin: EdgeInsets.all(20),
//                                           padding: const EdgeInsets.all(10),
//                                           decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(100),
//                                               color: Colors.teal,
//                                               border: Border.all(
//                                                   width: 2
//                                               )
//                                           ),
//                                           child: Text(
//                                             snapshot.data![index].id!.toString(),
//                                             style: const TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w700),
//                                           )
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         snapshot.data![index].firstName,
//                                         style: const TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text(
//                                         snapshot.data![index].lastName,
//                                         style: const TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//
//                                       Text(snapshot.data![index].email),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       // Text(snapshot.data![index].city),
//                                       // const SizedBox(
//                                       //   height: 10,
//                                       // ),
//                                       //Text(snapshot.data![index].phone),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 35.0),
//                                         child: Row(
//                                           children: [
//                                             IconButton(
//                                                 onPressed: () async {
//                                                   // Navigator.pushNamed(context, "second",arguments: {"name" :
//                                                   //   "Bijendra", "rollNo": 65210});
//
//                                                   //
//                                                   Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) => SignUp(
//                                                           isUpdate: true,
//                                                           id: snapshot
//                                                               .data![index].id!,
//                                                           firstName: snapshot
//                                                               .data![index].firstName,
//                                                           lastName: snapshot
//                                                               .data![index].lastName,
//                                                           email: snapshot
//                                                               .data![index].email,
//                                                           city: snapshot
//                                                               .data![index].city,
//                                                           phone: snapshot
//                                                               .data![index].phone,
//                                                         )),
//                                                   );
//                                                 },
//                                                 icon: const Icon(
//                                                   Icons.edit_sharp,
//                                                   color: Colors.indigo,
//                                                 )),
//                                             IconButton(
//                                                 onPressed: () {
//                                                   //   print(snapshot.data![index].id);
//                                                   handler.deleteUser(
//                                                       snapshot.data![index].id!.toInt());
//                                                   setState(() {
//                                                     //handler.deleteUser(p);
//                                                   });
//                                                   getList();
//                                                 },
//                                                 icon: const Icon(
//                                                   Icons.delete_forever,
//                                                   color: Colors.red,
//                                                 )),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: (index % 2) == 0
//                                         ? Colors.lightBlueAccent
//                                         : Colors.tealAccent,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//
//                 ),
//
//               ),
//             );
//             //   ListView.builder(
//             //   itemCount: snapshot.data?.length,
//             //   itemBuilder: (BuildContext context, int index) {
//             //     //print(index);
//             //     return Card(
//             //             child: ListTile(
//             //       contentPadding: const EdgeInsets.all(8.0),
//             //       title: Text(
//             //         snapshot.data![index].firstName.toUpperCase(),
//             //         style: const TextStyle(
//             //             fontSize: 20, fontWeight: FontWeight.w600),
//             //       ),
//             //       subtitle: Row(children: [
//             //         Padding(
//             //           padding: const EdgeInsets.only(right: 8.0),
//             //           child: Text(snapshot.data![index].lastName),
//             //         ),
//             //         Text(snapshot.data![index].email),
//             //       ]),
//             //       leading: IconButton(
//             //           onPressed: () async {
//             //             // Navigator.pushNamed(context, "second",arguments: {"name" :
//             //             //   "Bijendra", "rollNo": 65210});
//             //
//             //             //
//             //             Navigator.push(
//             //               context,
//             //               MaterialPageRoute(
//             //                   builder: (context) => SignUp(
//             //                         isUpdate: true,
//             //                         id: snapshot.data![index].id!,
//             //                         firstName: snapshot.data![index].firstName,
//             //                         lastName: snapshot.data![index].lastName,
//             //                         email: snapshot.data![index].email,
//             //                      city : snapshot.data![index].city,
//             //                     phone: snapshot.data![index].phone,
//             //                       )),
//             //             );
//             //           },
//             //           icon: const Icon(
//             //             Icons.edit_sharp,
//             //             color: Colors.indigo,
//             //           )),
//             //       trailing: IconButton(
//             //           onPressed: () {
//             //             //   print(snapshot.data![index].id);
//             //             handler.deleteUser(snapshot.data![index].id!.toInt());
//             //             setState(() {
//             //               //handler.deleteUser(p);
//             //             });
//             //             getList();
//             //           },
//             //           icon: const Icon(
//             //             Icons.delete_forever,
//             //             color: Colors.red,
//             //           )),
//             //     ));
//             //   },
//             // );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
//
// // _delete() {
// //   setState(() {
// //     // DatabaseHandler().deleteUser(handler.deleteUser(id));
// //     // handler.deleteUser(2).toString();
// //   });
// // }
// }
