import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sync_data/binding/binding.dart';
import 'package:sync_data/screen/home_screen.dart';
import 'package:sync_data/screen/screen.dart';

import 'routs.dart';

void main() {
  runApp( const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.pageId,
      initialBinding: SplashBinding(),
      getPages: appPage,
    );
  }
}


