import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sync_data/screen/add_data.dart';
import 'package:sync_data/screen/home_screen.dart';

import 'binding/binding.dart';

final List<GetPage> appPage = [
  GetPage(
      name: HomeScreen.pageId,
      page: () => HomeScreen(),
      binding: HomeBinding()),
  GetPage(
      name: AddDataScreen.pageId,
      page: ()=>  AddDataScreen(),
    binding: AddDataBinding()
  )
];