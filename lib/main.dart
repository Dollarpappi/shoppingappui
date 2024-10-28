import 'package:eazi_shoppin/providers/cart_provider.dart';
import 'package:eazi_shoppin/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // types of provider 
  // 1 Provider 
  // 2 changenotifier
  // 3 FutureProvider
  // 4 streamprovider
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
          seedColor: const  Color.fromARGB(255, 248, 228, 4),
          primary: const  Color.fromARGB(255, 248, 228, 4)),
          fontFamily: "Grypen",
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),
            centerTitle: true,
            elevation: 0,
      
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
          ),
          
        useMaterial3: true,
        ),
       
        home: const MyHomePage(),
      ),
    );
  }
}