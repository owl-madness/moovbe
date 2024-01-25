import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/bus/controller/bus_provider.dart';
import 'package:moovbe_bus_booking/modules/driver/controller/driver_provider.dart';
import 'package:moovbe_bus_booking/modules/home/controller/home_provider.dart';
import 'package:moovbe_bus_booking/modules/login/controller/login_provider.dart';
import 'package:moovbe_bus_booking/modules/login/screen/get_started_screen.dart';
import 'package:moovbe_bus_booking/utilities/shared_preference.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharePreferenceHelper.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LoginProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => BusProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => DriverProvider(),
    ),
  ], child: const MyApp()));
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
