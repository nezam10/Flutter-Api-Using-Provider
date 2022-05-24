import 'package:flutter/material.dart';
import 'package:flutter_api_using_provider/provider_class/data.dart';
import 'package:flutter_api_using_provider/screens/view_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Data>(create: (context) => Data()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewScreen(),
    );
  }
}
