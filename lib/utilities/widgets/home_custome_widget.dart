import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';

class HomeSwitchWidget extends StatelessWidget {
  const HomeSwitchWidget(
      {super.key,
      required this.bgColor,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.assetImagePath,
      this.onTap});
  final Color bgColor;
  final String cardTitle;
  final String cardSubTitle;
  final String assetImagePath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(7),
                Text(
                  cardTitle,
                  style: TextStyle(
                      fontSize: 26,
                      color: ColorResources.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(cardSubTitle,
                    style: TextStyle(
                      fontSize: 10,
                      color: ColorResources.white,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  assetImagePath,
                  width: 100,
                  height: 100,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
