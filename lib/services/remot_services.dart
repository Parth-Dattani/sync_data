import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class RemoteServices {
  static var client = http.Client();


  static const accessToken = "7b9e3b08-6c44-4b1f-acd4-959df8b36d1e";

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


  static Future<http.Response> registerAPI(
      String userName,
      //String firstName, String lastName,
      String email, String password
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





  static Future<Map<String, dynamic>> aggregateFitnessData(DateTime startDate, DateTime endDate) async {
    final url = "https://www.googleapis.com/fitness/v1/users/me/dataset:aggregate";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        "aggregateBy": [
          {
            "dataTypeName": "com.google.step_count.delta",
            "dataSourceId": "derived:com.google.step_count.delta:com.google.android.gms:estimated_steps",
          },
        ],
        "bucketByTime": {"durationMillis": 86400000},
        "startTimeMillis": startDate.millisecondsSinceEpoch,
        "endTimeMillis": endDate.millisecondsSinceEpoch,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception("Failed to aggregate fitness data: ${response.statusCode}");
    }
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


  static Future<http.Response> getData() async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
      '-content-encoding': 'gzip',
    };

    http.Response response = await http.get(
      Uri.parse("${Apis.baseAPI}"),
      headers: header,
    );
    printResponse(header, null, response);
    return response;
  }

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