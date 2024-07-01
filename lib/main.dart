
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_provider/providers/movie_provider.dart';
import 'package:movie_provider/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return ChangeNotifierProvider<MovieProvider>(
       create: (_)=> MovieProvider(),
       child: MaterialApp(
         title: "Flutter Demo",
         theme: ThemeData(
           primarySwatch: Colors.blue,
         ),
         home: HomeScreem(),
       ),
     );
   }
 }





// theme: ThemeData(
//
// colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// useMaterial3: true,
// ),
