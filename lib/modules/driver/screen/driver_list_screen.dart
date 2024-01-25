import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/modules/driver/controller/driver_provider.dart';
import 'package:moovbe_bus_booking/modules/driver/screen/add_driver_screen.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';
import 'package:moovbe_bus_booking/utilities/widgets/driver_list_tile.dart';
import 'package:provider/provider.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({super.key});

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  void initState() {
    Provider.of<DriverProvider>(context, listen: false).fetchDriverList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.primaryBlack,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Driver List',
          style: TextStyle(fontSize: 16),
        ),
      ),
      bottomNavigationBar: CustomButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDriver(),
              ));
        },
        buttonText: 'Add Driver',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Consumer<DriverProvider>(
            builder: (context, value, child) => Column(children: [
              Gap(10),
              Row(
                children: [
                  Gap(20),
                  Text(
                    '${value.driverList.length} Drivers Found',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: value.driverList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DriverListTile(
                      data: value.driverList[index],
                      onTap: () => value.deleteDriver(
                          context, value.driverList[index].id!),
                    ),
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
