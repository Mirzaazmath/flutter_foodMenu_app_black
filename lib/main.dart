import 'package:flutter/material.dart';

import 'Screens/homescreen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        scaffoldBackgroundColor:const  Color(0xff354249),
        primaryColor:const  Color(0xffbf202b),
      ),
      home: const HomeScreen(),
    );
  }
}
