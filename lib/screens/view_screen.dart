import 'package:flutter/material.dart';
import 'package:flutter_api_using_provider/provider_class/data.dart';
import 'package:provider/provider.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  // Future<DataModel> getData(contex) async {
  List<Data> list_data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<Data>(context, listen: false);
    data.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Network Data"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: Data().getData(context),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data.dataModel!.title.toString()),
                      leading: Text(data.dataModel!.id.toString()),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}





// FutureBuilder(
//                 future: Data().getData(context),
//                 builder: (context, AsyncSnapshot snapshot) {
//                   if(snapshot.hasData){
//                     return ListView.builder(
//                       itemCount:,
//                       itemBuilder: (context, index){
//                         return ListTile(
//                 title: Text(data.dataModel!.title.toString()),
//                 leading: Text(data.dataModel!.id.toString()),
//               );
//                       },
//                       );
//                   }
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 },
//               )