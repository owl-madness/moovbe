import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/modules/driver/model/driver_list_model.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';

class DriverListTile extends StatelessWidget {
  const DriverListTile({super.key, required this.onTap, this.data});
  final void Function() onTap;
  final DriverListItemModel? data;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 0.3, color: Color.fromRGBO(193, 193, 193, 1))),
        child: Row(
          children: [
            Container(
              height: 73,
              width: 79,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 243, 243, 1),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircleAvatar(
                    child: Image.asset(
                      'assets/images/driver_image_2.png',
                    )),
              ),
            ),
            Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.name ?? '',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(71, 71, 71, 1)),
                ),
                Text('License no: ${data?.licenseNo}',
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
                buttonText: 'Delete')
          ],
        ),
      ),
    );
    ;
  }
}
