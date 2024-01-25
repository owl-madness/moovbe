import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/modules/bus/model/bus_list_item_model.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/bus_seat_widget.dart';

class BusDetailsPage extends StatelessWidget {
  const BusDetailsPage({super.key, this.model});
  final BusListItemModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.primaryBlack,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          ("${model?.name ?? ''} ${model?.type ?? ''}"),
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(28),
              DriverCard(
                  driverName: model?.driverName ?? '',
                  licenseNo: model?.driverLicenseNo ?? ''),
              BusSeatWidget(is2x2Bus: false),
            ],
          ),
        ),
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  const DriverCard(
      {super.key, required this.driverName, required this.licenseNo});
  final String driverName;
  final String licenseNo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 116,
      decoration: BoxDecoration(
          color: ColorResources.primaryBlack,
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset(
            'assets/images/driver_image.png',
            width: 132,
            height: 116,
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      driverName,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'License no: $licenseNo',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
