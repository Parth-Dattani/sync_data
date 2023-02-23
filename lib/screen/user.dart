// import 'dart:core';
// import 'package:flutter/material.dart';
//
// import '../../Database/dbhelper.dart';
// import '../Model/model_class.dart';
//
// class User extends StatefulWidget {
//   bool isUpdate;
//   final int id;
//   final String title;
//   final String description;
//   final String date;
//   final String status;
//
//   User(
//       {Key? key,
//       required this.isUpdate,
//       required this.id,
//       required this.title,
//       required this.description,
//       required this.date,
//       required this.status})
//       : super(key: key);
//
//   @override
//   State<User> createState() => _UserState();
// }
//
// class _UserState extends State<User> {
//   final myform = GlobalKey<FormState>();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   TextEditingController statusController = TextEditingController();
//
//   //DateTime selectedDateAndTime ;
//   DateTime selectedDate = DateTime.now();
//
//   //var da = DateFormat('dd-MM-yyyy ').format(DateTime.now());
//
//   final dt = DateTime.now();
//
//   final assd = DateTime.parse("2020-01-01 00:00:01Z");
//   // final formattedStrs = DateTime('now', 'localtime'))
//
//   String radioValue= "complete";
//
//   @override
//   void initState() {
//     if (widget.isUpdate) {
//       titleController.text = widget.title;
//       descriptionController.text = widget.description;
//       statusController.text = widget.status;
//       //dateController.text = widget.date;
//     }
//   }
// //  final formattedStr = formatDate(DateTime.now(), [dd, '.', mm, '.', yy, ' ', HH, ':', nn]);
//
//   @override
//   Widget build(BuildContext context) {
//     print("Hello");
//     print(widget.isUpdate);
//     print(widget.title);
//
//     return MaterialApp(
//       home: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: const Text("Task List"),
//           leading: const Icon(Icons.menu),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => const Display()));
//                 },
//                 icon: const Icon(Icons.home)),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Form(
//             key: myform,
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   widget.isUpdate ? "Update Task" : "Add Task",
//                   style: TextStyle(
//                       fontSize: (35),
//                       color: Colors.indigo.shade800,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: titleController,
//                   decoration: InputDecoration(
//                     hintText: "Title",
//                     prefixIcon: const Icon(Icons.person,
//                         color: Colors.deepPurpleAccent),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                   // onChanged: (val) {
//                   //    = val;
//                   // },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter title';
//                     }
//                     return null;
//                   },
//                   obscureText: false,
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: descriptionController,
//                   decoration: InputDecoration(
//                     hintText: "Description",
//                     prefixIcon: const Icon(Icons.person,
//                         color: Colors.deepPurpleAccent),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'description must Write Something...';
//                     }
//                     return null;
//                   },
//                   obscureText: false,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text("Task Status"),
//                 Row(
//                   children: [
//                     Radio<String>(
//                         //value:  widget.isUpdate== false? "complete": widget.status,
//                       value: "complete",
//                         groupValue:radioValue,
//                         onChanged: (value) {
//                           setState(() {
//                             radioValue = value!;
//                             statusController.text = value;
//                           });
//                         }),
//                     Text("complete"),
//                     Radio<String>(
//                         //value:  widget.isUpdate==false? "pending": widget.status,
//                       value: "pending",
//                         groupValue:radioValue,
//                         onChanged: (value) {
//                           setState(() {
//                             radioValue = value!;
//                             statusController.text = value;
//                           });
//                         }),
//                     Text("pending"),
//                   ],
//                 ),
//
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Padding(padding: EdgeInsets.all(10)),
//                 Container(
//                   width: 340,
//                   height: 55,
//                   child: MaterialButton(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       widget.isUpdate ? "Update" : "Add",
//                       style: const TextStyle(fontSize: 20),
//                     ),
//                     color: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () => {
//                       const Display(),
//                       if (widget.isUpdate)
//                         {
//                           print("iff true"),
//                           print(widget.isUpdate),
//                           if (myform.currentState!.validate())
//                             {
//                               print("ffs"),
//                               myform.currentState?.save(),
//                               DatabaseHandler()
//                                   .updateTask(Task(
//                                       id: widget.id,
//                                       title: titleController.text,
//                                       description: descriptionController.text))
//                                   .then((value) => setState(() {
//                                         widget.isUpdate = false;
//                                         print(widget.isUpdate);
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     const Display()));
//                                       })),
//                               print("done uod"),
//                               print(widget.isUpdate),
//                             },
//                         }
//                       else if (myform.currentState!.validate())
//                         {
//                           myform.currentState?.save(),
//                           print('add ok'),
//                           print(selectedDate),
//                         //  print('format ' + da),
//                           //_scaffoldKey.currentState.ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             duration: const Duration(milliseconds: 8000),
//                             content: Row(
//                               children: const <Widget>[
//                                 CircularProgressIndicator(),
//                                 Text("  Task Added...")
//                               ],
//                             ),
//                           )),
//                           DatabaseHandler()
//                               .add(Task(
//                                 title: titleController.text,
//                                 description: descriptionController.text,
//                               ))
//                               .whenComplete(() => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => const Display()),
//                                   )),
//                         }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Date_picker(BuildContext context) async {
//     final DateTime? selected = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now().subtract(const Duration(days: 0)),
//       lastDate: DateTime(2050),
//
//       //selectableDayPredicate: (DateTime val) => val.day == DateTime.now().day-1  ? false : true,
//     );
//     // if (selected != null && selected != selectedDate) {
//     //   setState(() {
//     //     selectedDate = selected;
//     //     dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
//     //   });
//     // }
//   }
// }
