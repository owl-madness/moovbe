import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/login/screen/login_screen.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.primaryRed,
      bottomNavigationBar: CustomButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        },
        buttonText: 'Get Started',
        textColor: ColorResources.primaryRed,
        bgColor:ColorResources.white ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 205,
            )
          ],
        ),
      ),
    );
  }
}
