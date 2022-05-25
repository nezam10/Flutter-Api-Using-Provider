import 'package:flutter/material.dart';
import 'package:flutter_api_using_provider/model_class/data_model.dart';
import 'package:flutter_api_using_provider/provider_class/data_class.dart';
import 'package:provider/provider.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  Future<List<DataModel>>? datamodel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Network Data"),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: postModel.userInfoList!.length,
                itemBuilder: (context, index) {
                  if (index != null) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            postModel.userInfoList![index].title.toString()),
                        leading:
                            Text(postModel.userInfoList![index].id.toString()),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
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