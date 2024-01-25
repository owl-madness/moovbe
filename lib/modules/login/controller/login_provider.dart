import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/home/screen/home_screen.dart';
import 'package:moovbe_bus_booking/modules/login/repository/login_repository.dart';

class LoginProvider extends ChangeNotifier {
  LoginRepository repository = LoginRepository();

  void checkLogin(BuildContext context, {required String username,required String password}) {
    repository.checkLogin(username, password);
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
  }
}