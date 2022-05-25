import 'package:flutter/material.dart';
import 'package:flutter_api_using_provider/provider_class/data_class.dart';
import 'package:flutter_api_using_provider/screens/view_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<DataClass>(create: (context) => DataClass()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewScreen(),
    );
  }
}
