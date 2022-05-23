import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_using_provider/model_class/data_model.dart';
import 'package:http/http.dart' as http;

class Data extends ChangeNotifier {
  late DataModel dataModel;

  fetchData(context) async {
    dataModel = await getData(context);

    notifyListeners();
  }

  Future<DataModel> getData(contex) async {
    DataModel dataModel;
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        dataModel = DataModel.fromJson(data);
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
    return DataModel();
  }
}

//example
//https://www.androidcoding.in/2021/11/19/flutter-network-call-example-using-provider-get/
