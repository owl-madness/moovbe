import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/modules/driver/screen/add_driver_screen.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';
import 'package:moovbe_bus_booking/utilities/widgets/driver_list_tile.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({super.key});

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.primaryBlack,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Driver List',style: TextStyle(fontSize: 16),),
      ),
      bottomNavigationBar: CustomButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddDriver(),));
      }, buttonText: 'Add Driver',),
      body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(children: [
          Gap(10),
          Row(
            children: [
              Gap(20),
              Text(
                '21 Buses Found',
                textAlign: TextAlign.start,
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DriverListTile(
                  onTap: () {},
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
