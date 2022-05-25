import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'data_model.dart';

Future<DataModel> getData() async {
  DataModel? result;
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/"),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    },
  );
  final item = jsonDecode(response.body);
  print(item);
  result = DataModel.fromJson(item);
  //print(item);
  return result;
}

Future<List<DataModel>?> getUsers() async {
  try {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<DataModel> userList = userModelFromJson(response.body);
      return userList;
    }
  } catch (e) {
    log(e.toString());
  }

  return null;
}



// Future<List<UserInfo>?> getUsers() async {
//   try {
//     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.albums);
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       List<UserInfo> userList = userModelFromJson(response.body);
//       return userList;
//     }
//   } catch (e) {
//     log(e.toString());
//   }
//   return null;
// }
