import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/home/controller/home_provider.dart';
import 'package:moovbe_bus_booking/modules/login/controller/login_provider.dart';
import 'package:moovbe_bus_booking/modules/login/screen/get_started_screen.dart';
import 'package:moovbe_bus_booking/modules/login/screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider(),),
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetStarted(),
    );
  }
}
