import 'package:flutter/material.dart';
import 'package:flutter_api_using_provider/model_class/data_model.dart';
import 'package:flutter_api_using_provider/model_class/service_class.dart';

class DataClass extends ChangeNotifier {
  //DataModel? post;
  late List<DataModel>? userInfoList = [];
  bool loading = false;

  getPostData() async {
    loading = true;
    //post = (await getData());
    loading = false;
    notifyListeners();
  }

  void getData() async {
    userInfoList = (await getUsers())!;
    notifyListeners();
  }
}





















  // Future<DataModel?> getData(contex) async {
  //   List<DataModel> list = [];
  //   //list.add(dataModel!);
  //   DataModel? dataModel;
  //   try {
  //     final response = await http
  //         .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       print(data);
  //       dataModel = DataModel.fromJson(data);
  //     } else {
  //       print("Something went wrong");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return dataModel;
  // }


//example
//https://www.androidcoding.in/2021/11/19/flutter-network-call-example-using-provider-get/
// https://stackoverflow.com/questions/67438458/mapping-api-call-to-model-class-in-flutter
// https://stackoverflow.com/questions/55612365/flutter-how-to-parse-the-json-from-the-model-class-in-flutter
//importent
//https://www.dbestech.com/tutorials/flutter-provider-http-get-request-restful-api-example