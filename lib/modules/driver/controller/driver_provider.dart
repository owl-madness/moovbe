import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/driver/model/driver_list_model.dart';
import 'package:moovbe_bus_booking/modules/driver/repository/driver_repository.dart';
import 'package:provider/provider.dart';

class DriverProvider extends ChangeNotifier {
  DriverRepository repository = DriverRepository();
  List<DriverListItemModel> driverList = [];
  bool isLoading = true;
  bool deleting = false;
  bool addingDriver = false;

  fetchDriverList() async {
    try {
      driverList = await repository.fetchDrivers();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('error: $e');
      isLoading = false;
      notifyListeners();
    }
  }

  deleteDriver(BuildContext context, int driverId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure to delete?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
          TextButton(
            onPressed: () async {
              try {
                deleting = true;
                notifyListeners();
                var response = await repository.deleteDriver(driverId);
                if (response?.status ?? false) {
                  addingDriver = true;
                  notifyListeners();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response?.message ?? '')));
                  Provider.of<DriverProvider>(context, listen: false)
                      .fetchDriverList();
                  Navigator.pop(context);
                }
              } catch (e) {
                deleting = false;
                notifyListeners();
              }
            },
            child: Text('Delete'),
          )
        ],
      ),
    );
  }

  addDriver(
      BuildContext context, String name, String license, String mobile) async {
    try {
      addingDriver = true;
      notifyListeners();
      var response = await repository.addDriver(name, license, mobile);
      if (response.status ?? false) {
        addingDriver = true;
        notifyListeners();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.message ?? '')));
        Provider.of<DriverProvider>(context, listen: false).fetchDriverList();
        Navigator.pop(context);
      }
    } catch (e) {
      deleting = false;
      notifyListeners();
    }
  }
}
