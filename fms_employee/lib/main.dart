import 'package:flutter/material.dart';
import 'package:fms_employee/providers/data_class.dart';
import 'package:provider/provider.dart';


void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<DataClass>(create: (context) => DataClass()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => AppState();
}