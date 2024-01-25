import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/login/controller/login_provider.dart';
import 'package:moovbe_bus_booking/modules/login/screen/login_screen.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';
import 'package:moovbe_bus_booking/utilities/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
   Future.delayed(Duration.zero, () {
    Provider.of<LoginProvider>(context, listen: false)
        .checkUserLoggedState(context);
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.primaryRed,
      bottomNavigationBar: Consumer<LoginProvider>(
        builder: (context, value, child) => CustomButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          },
          buttonText: 'Get Started',
          textColor: ColorResources.primaryRed,
          bgColor: ColorResources.white,
          isLoading: value.getStartedLoading,
        ),
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
