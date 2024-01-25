import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';

class BusListTile extends StatelessWidget {
  const BusListTile({super.key, required this.onTap, });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.3,color: Color.fromRGBO(193, 193, 193, 1))),
        child: Row(
          children: [
            Container(
              height: 73,
              width: 79,
              decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
              child: Image.asset(
                'assets/images/bus_image_2.png',
                height: 38,
                width: 62,
              ),
            ),
            Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KSRTC',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(71, 71, 71, 1)),
                ),
                Text('Swift Scania P-​series',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(71, 71, 71, 1))),
              ],
            ),
            Spacer(),
            CustomButton(
                height: 35,
                width: 70,
                bgColor: ColorResources.primaryRed,
                textColor: ColorResources.white,
                padding: EdgeInsets.zero,
                textStyle: TextStyle(color: ColorResources.white, fontSize: 10),
                onPressed: onTap,
                buttonText: 'Manage')
          ],
        ),
      ),
    );
  }
}