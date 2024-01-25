import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/modules/bus/controller/bus_provider.dart';
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
  void initState() {
    Provider.of<BusProvider>(context, listen: false).fetchBusList();
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Consumer<HomeProvider>(
            builder: (context, value, child) => Column(
              children: [
                const Gap(20),
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
                      assetImagePath: 'assets/images/driver_image.png',
                      onTap: () => value.onDriverPressed(context),
                    ),
                  ],
                ),
                Gap(21),
                Consumer<BusProvider>(
                  builder: (context, busProvider, child) => Column(
                    children: [
                      Row(
                        children: [
                          const Gap(10),
                          Text(
                            '${busProvider.busList.length} Buses Found',
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      busProvider.isLoading ? const CircularProgressIndicator() : ListView.builder(
                        shrinkWrap: true,
                        itemCount: busProvider.busList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BusListTile(
                             data: busProvider.busList[index],
                              onTap: () => value.onBusPressed(context,busProvider.busList[index]),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
