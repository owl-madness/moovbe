import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/bus_seat_widget.dart';

class BusDetailsPage extends StatefulWidget {
  const BusDetailsPage({super.key});

  @override
  State<BusDetailsPage> createState() => _BusDetailsPageState();
}

class _BusDetailsPageState extends State<BusDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.primaryBlack,
        foregroundColor: Colors.white,
        title: Text('KSRTC Swift Scania P-​series',style: TextStyle(fontSize: 16),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Gap(28),
              DriverCard(),
              BusSeatWidget(is2x2Bus: false),
              
              ],
          ),
        ),
      ),
    );
  }
}


class DriverCard extends StatelessWidget {
  const DriverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 116,
      decoration: BoxDecoration(
        color: ColorResources.primaryBlack,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset('assets/images/driver_image.png', width: 132,
      height: 116,),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Rohit sharma',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('License no: PJ515196161655',style: TextStyle(fontSize: 12,color: Colors.white),),
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