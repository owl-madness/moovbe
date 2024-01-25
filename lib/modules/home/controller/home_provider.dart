import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/bus/screen/bus_details_screen.dart';
import 'package:moovbe_bus_booking/modules/driver/screen/driver_list_screen.dart';

class HomeProvider extends ChangeNotifier {
  void fetchBusList() {}

  void onBusPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BusDetailsPage(),));
  }

   void onDriverPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DriverListScreen(),));
  }
}