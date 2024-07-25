import 'package:flutter/material.dart';
import 'package:my_monthly_salary/home_page.dart';

void main(){
  runApp(const RunApp());
}

  class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(home: MainScreen());

  }
}

