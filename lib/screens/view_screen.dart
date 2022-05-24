import 'package:flutter/material.dart';
import 'package:flutter_api_using_provider/model_class/data_model.dart';
import 'package:flutter_api_using_provider/provider_class/data.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  // Future<DataModel> getData(contex) async {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<Data>(context, listen: false);
    data.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Network Data"),
      ),
      body: Center(
        child: Container(
          child: Text(data.title.toString()),
        ),
      ),
    );
  }
}
