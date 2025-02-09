import 'package:flutter/material.dart';
import 'new_dashboard.dart';

class AppMaterialApp extends StatelessWidget {
  const AppMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahitto Karigor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewDashboard(),
   // home: const DashBoard(),
    );
  }
}