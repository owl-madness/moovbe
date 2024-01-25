import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/bus/model/bus_list_item_model.dart';
import 'package:moovbe_bus_booking/modules/bus/screen/bus_details_screen.dart';
import 'package:moovbe_bus_booking/modules/driver/screen/driver_list_screen.dart';

class HomeProvider extends ChangeNotifier {

  void onBusPressed(BuildContext context,BusListItemModel busModel) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BusDetailsPage(model: busModel),));
  }

   void onDriverPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DriverListScreen(),));
  }
}