import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(onPressed: () {
        
      }, buttonText: 'Login',bgColor: ColorResources.primaryRed,textStyle: buttonTextStyle.copyWith(color: ColorResources.white)),
      body: Column(
        children: [
          Container(
            height: 280,
            color: ColorResources.primaryBlack,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                Positioned(
                    right: -20,
                    top: -20,
                    child: Image.asset(
                      'assets/images/polygon.png',
                      height: 280,
                    )),
                Positioned(
                  top: 150,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                fontSize: 35,
                                color: ColorResources.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Manage your Bus and Drivers',
                            style: TextStyle(
                                fontSize: 16, color: ColorResources.white),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Gap(30),
          CustomeTextField(
            hintText: 'Enter Username',
          ),
          Gap(17),
          CustomeTextField(
            hintText: 'Enter Password',
          )
        ],
      ),
    );
  }
}
