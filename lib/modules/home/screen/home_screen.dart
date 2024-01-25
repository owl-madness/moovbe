import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/modules/home/controller/home_provider.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/bus_list_tile.dart';
import 'package:moovbe_bus_booking/utilities/widgets/home_custome_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.primaryBlack,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          color: ColorResources.primaryBlack,
          child: Image.asset(
            'assets/images/logo.png',
            width: 126,
            height: 41,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Consumer<HomeProvider>(
          builder: (context, value, child) =>  Column(
            children: [
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeSwitchWidget(
                      bgColor: ColorResources.primaryRed,
                      cardTitle: 'Bus',
                      cardSubTitle: 'Manage your Bus',
                      assetImagePath: 'assets/images/bus_image.png'),
                      HomeSwitchWidget(
                      bgColor: ColorResources.primaryBlack,
                      cardTitle: 'Driver',
                      cardSubTitle: 'Manage your Driver',
                      assetImagePath: 'assets/images/driver_image.png'),
                ],
              ),
              Gap(21),
              Row(
                children: [
                  Gap(10),
                  Text('21 Buses Found',textAlign: TextAlign.start,),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: BusListTile(
                      onTap: () => value.onBusPressed(context),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
