import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/bus/model/bus_list_item_model.dart';
import 'package:moovbe_bus_booking/modules/bus/repository/bus_repository.dart';

class BusProvider extends ChangeNotifier {
  List<BusListItemModel> busList = [];
  bool isLoading = true;
  BusRepository repository = BusRepository();
  fetchBusList() async {
    try {
      busList = await repository.fetchBuses();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('error: $e');
      isLoading = false;
      notifyListeners();
    }
  }
}
