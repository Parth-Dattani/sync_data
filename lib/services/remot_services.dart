import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class RemoteServices {
  static var client = http.Client();

  //static const accessToken = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJTaW1wbGVUaXguQm94T2ZmaWNlVXNlcklkIjoiNTU3NjYiLCJTaW1wbGVUaXguVXNlck5hbWUiOiJyYWoucGF0ZWxAdGhlb25ldGVjaG5vbG9naWVzLmNvLmluIiwiU2ltcGxlVGl4LkZpcnN0TmFtZSI6IlJhaiIsImdpdmVuX25hbWUiOiJSYWoiLCJTaW1wbGVUaXguTGFzdE5hbWUiOiJQYXRlbCIsImZhbWlseV9uYW1lIjoiUGF0ZWwiLCJTaW1wbGVUaXguRW1haWwiOiJyYWoucGF0ZWxAdGhlb25ldGVjaG5vbG9naWVzLmNvLmluIiwiU2ltcGxlVGl4LlByb2ZpbGVQaWN0dXJlIjoiIiwiU2ltcGxlVGl4LlJvbGVJZCI6IjEiLCJTaW1wbGVUaXguUm9sZU5hbWUiOiIiLCJTaW1wbGVUaXguQXBwbGljYXRpb25JZCI6IjQ2ZTg5MjRhLWJiMWMtNGViZC05ZjRkLTIxNjkzZDk4NmExZSIsImp0aSI6IjI4MmZjNTY1LTc3MmQtNDUwNC05OWJjLTNkNDE1MzNmYTlhOSIsIm5iZiI6MTY3Njk1Njk5OCwiZXhwIjoxNjc3NTYxNzk4LCJpc3MiOiJJc3N1ZXIiLCJhdWQiOiJBdWRpZW5jZSJ9.WQB7wnIB8FCuPFu4LTJDox_tjSE2-kLxHKlLVqxXE3rGfeRTekK-rYin9a_DDnJ-6nGYSyzJY_aCEWAarxETAQ";
  static const accessToken = "a07d6550-9a6a-456c-8d5c-2a3bf7b9859a";

  static void printResponse(
      Map<String, String> header, dynamic body, http.Response response) {
    print('Header: $header');
    print('Body : $body');
    print('URL: ${response.request!.url}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<http.Response> dataApi() async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    // String postBody = json.encode({
    //   "orderId": 123,
    //   "orderNumber": '0183',
    //   "organization": "TOT",
    // });
    http.Response response = await http.get(
      Uri.parse(Apis.dataAPI),
      headers: header,
      // body: postBody,
    );
    printResponse(header, null, response);
    return response;
  }

  static Future<http.Response> getProductData() async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    // String postBody = json.encode({
    //   "orderId": 123,
    //   "orderNumber": '0183',
    //   "organization": "TOT",
    // });
    http.Response response = await http.get(
      Uri.parse(Apis.productAPI),
      headers: header,
      // body: postBody,
    );
    printResponse(header, null, response);
    return response;
  }

  static Future<http.Response> getUserData() async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    // String postBody = json.encode({
    //   "orderId": 123,
    //   "orderNumber": '0183',
    //   "organization": "TOT",
    // });
    http.Response response = await http.get(
      Uri.parse(Apis.userAPI),
      headers: header,
      // body: postBody,
    );
    printResponse(header, null, response);
    return response;
  }

  static Future<http.Response> addUserData(
      int id, String name, String email) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    String postBody = json.encode({
      "name": name,
      "email": email,
      "password": '123456',
    });
    http.Response response = await http.post(
      Uri.parse(Apis.registerAPI),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);
    return response;
  }

  static Future<http.Response> registerAPI(
      String userName,
      //String firstName, String lastName,
      String email,
      String password
      //, String phone
      ) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      //'Authorization': 'Bearer $accessToken',
    };
    String postBody = json.encode({
      'username': userName,
      // 'first_name': firstName,
      // 'last_name': lastName,
      'email': email,
      //'phoneno': phone,
      'password': password,
      // 'user_role': 'coach',
      // 'device_identifier': 'qwerty_1234567890_Birlin',
      // 'is_ios':'13',
      // 'user_role': 'Manager',
      // 'device_identifier': 'qwerty_1234567890_parth',
      // 'recipient_id':'fdgdd_15644514_64545',
      // 'apple_shared_secret': '5612641564531564515',
    });
    http.Response response = await http.post(
      Uri.parse("${Apis.registerAPI}"),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);
    return response;
  }

/*  static Future<void> readHeartRateData() async {
    //final credentials = await obtainAccessCredentialsViaGoogleSignIn();
    final httpClient = http.Client();
    final fitnessApi = FitnessApi(httpClient);

    final startTime = DateTime.now().subtract(const Duration(days: 7)).millisecondsSinceEpoch;
    final endTime = DateTime.now().millisecondsSinceEpoch;

    final heartRateData = await fitnessApi.users.dataSources.datasets.get(
        'me',
        'derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm',
        '${startTime}000000-${endTime}000000'
    );

    final points = heartRateData.point;

    for (final point in points!) {
      final heartRate = point.value!.first.fpVal;
      final timeInMillis = point.startTimeNanos;
      // Do something with the data
    }
    print("heart beat :- ${heartRateData}");
  }*/

// static Future<http.Response> getCalData() async {
//   Map<String, String> header = {
//     'Content-Type': 'application/json; charset=UTF-8',
//     'Authorization': 'Bearer $accessToken',
//   };
//   http.Response response = await http.get(
//       //Uri.parse("https://www.google.com/calendar/events?eid=Nm9zMzBlMWg3NHM2NGJiNDZnc2owYjlrY2hqM2diOXA2NWgzY2I5bjZrbzZhYzFsNmdzamVwYjM2Y18xOTcwMDEwMVQwMDAwMDBaIG1heXVydGhlb25ldGVjaDFAbQ"),
//       Uri.parse("${Apis.baseAPI}${Apis.insertAPI}/$eventId"),
//       headers: header);
//   printResponse(header, null, response);
//   return response;
// }
}
