import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';

class BusSeatWidget extends StatelessWidget {
  const BusSeatWidget({
    super.key,
    required this.is2x2Bus,
  });
  final bool is2x2Bus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(width: 0.3, color: Color.fromRGBO(193, 193, 193, 1))),
      padding: EdgeInsets.all(38),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 12.0, top: 8.0, right: 60.0),
                child: Image.asset(
                  'assets/images/seat.png',
                  height: 22,
                  width: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: 9,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SeatRowWidget(
                is2x2Bus: is2x2Bus,
              );
            },
          )
        ],
      ),
    );
  }
}

class SeatRowWidget extends StatelessWidget {
  const SeatRowWidget({super.key, required this.is2x2Bus});
  final bool is2x2Bus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/seat.png',
              height: 22,
              width: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/seat.png',
              height: 22,
              width: 30,
              color: !(is2x2Bus)
                  ? Colors.transparent
                  : ColorResources.primaryRed,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/seat.png',
              height: 22,
              width: 30,
              color: (is2x2Bus)
                  ? Colors.transparent
                  : ColorResources.primaryRed,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/seat.png',
              height: 22,
              width: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/seat.png',
              height: 22,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
