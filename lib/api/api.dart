import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:multivendor_app/api/api_const.dart';

class ApiCall {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 9),
    ),
  );

  static dynamic getApi(url, token) async {
    print('$url :: $token');
    Response? response;
    try {
      response = await dio.get(url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.toString());
      if (response.statusCode != 200) {
        print(response.statusCode.toString());
      }
      print(response.runtimeType);
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        response = e.response!;
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return response!.data;
  }

  static dynamic postApi(url, bodyP) async {
    print(" url :: $url  body:: $bodyP");
    var body = json.encode(bodyP);
    Response response = await dio.post(
      url,
      data: body,
    );
    print(response.toString());
    if (response.statusCode != 200) {
      print(response.statusCode.toString());
    }
    print(response.runtimeType);
    return response.data;
  }

  static dynamic postApiWithAuth(url, bodyP, token) async {
    print(" postApiWithAuth url :: $url  body:: $bodyP  toke: $token");
    var body = json.encode(bodyP);
    Response response = await dio.post(url,
        data: body,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
    print(response.toString());
    if (response.statusCode != 200) {
      print(response.statusCode.toString());
    }
    print(response.runtimeType);
    return response.data;
  }
// static dynamic postApi(url,bodyP) async {
//   print("object:url: $url--- body:$bodyP");
//   var body=jsonEncode(bodyP);
//   print("object:url: $url--- body:$body");
//   try{
//     http.Response response = await http.post(Uri.parse(url),body: body);
//     if (response.statusCode == 200) {
//       print("object:${response.body}");
//       dynamic data = jsonDecode(response.body);
//       return data;
//     }
//   }catch(e){
//     print("exc is : $e");
//   }
// }
}
