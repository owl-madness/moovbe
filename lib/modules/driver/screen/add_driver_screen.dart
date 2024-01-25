import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/modules/driver/controller/driver_provider.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddDriver extends StatelessWidget {
  AddDriver({super.key});
  final nameTextController = TextEditingController();
  final licenseTextController = TextEditingController();
  final mobileTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.primaryBlack,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Add Driver',
          style: TextStyle(fontSize: 16),
        ),
      ),
      bottomNavigationBar: Consumer<DriverProvider>(
        builder: (context, value, child) => CustomButton(
          buttonText: 'Save',
          onPressed: () => value.addDriver(context,
              nameTextController.text.trim(),
              licenseTextController.text.trim(),
              mobileTextController.text.trim()),
        ),
      ),
      body: Column(
        children: [
          Gap(39),
          CustomTextField(
            controller: nameTextController,
            hintText: 'Enter Name',
          ),
          CustomTextField(
            controller: licenseTextController,
            hintText: 'Enter License Numeber',
          ),
          CustomTextField(
            controller: mobileTextController,
            hintText: 'Mobile Number',
            maxLength: 10,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }
}
