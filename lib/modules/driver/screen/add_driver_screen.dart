import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_textfield.dart';

class AddDriver extends StatelessWidget {
  const AddDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.primaryBlack,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Add Driver',style: TextStyle(fontSize: 16),),
      ),
      bottomNavigationBar: CustomButton(
        buttonText: 'Save',
        onPressed: () {
          
        },
      ),
      body: Column(
        children: [
          Gap(39),
          CustomTextField(
            hintText: 'Enter Name',

          ), CustomTextField(
            hintText: 'Enter License Numeber',

          ),
        ],
      ),
    );
  }
}