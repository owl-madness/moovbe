import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moovbe_bus_booking/modules/login/controller/login_provider.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<LoginProvider>(
        builder: (context, value, child) => CustomButton(
            onPressed: () => value.checkLogin(
              context,
                username: usernameTextController.text.trim(),
                password: passwordTextController.text.trim()),
            buttonText: 'Login',
            bgColor: ColorResources.primaryRed,
           textColor: ColorResources.white,
           isLoading: value.isLoading),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            const Gap(30),
            CustomTextField(
              controller: usernameTextController,
              hintText: 'Enter Username',
            ),
            const Gap(17),
            CustomTextField(
              controller: passwordTextController,
              hintText: 'Enter Password',
            )
          ],
        ),
      ),
    );
  }
}
