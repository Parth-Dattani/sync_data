import 'package:get/get_navigation/src/routes/get_route.dart';
import 'binding/binding.dart';
import 'screen/screen.dart';

final List<GetPage> appPage = [
  GetPage(
      name: HomeScreen.pageId,
      page: () => HomeScreen(),
      binding: HomeBinding()),
  GetPage(
      name: AddDataScreen.pageId,
      page: () => AddDataScreen(),
      binding: AddDataBinding()),
  GetPage(
      name: SplashScreen.pageId,
      page: () => SplashScreen(),
      binding: SplashBinding()),
  GetPage(
      name: LoginScreen.pageId,
      page: () => LoginScreen(),
      binding: LoginBinding()),
  GetPage(
      name: SignupScreen.pageId,
      page: () => SignupScreen(),
      binding: SignupBinding()),
];
