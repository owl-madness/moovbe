import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/modules/home/screen/home_screen.dart';
import 'package:moovbe_bus_booking/modules/login/repository/login_repository.dart';
import 'package:moovbe_bus_booking/utilities/shared_preference.dart';

class LoginProvider extends ChangeNotifier {
  LoginRepository repository = LoginRepository();
  bool isLoading = false;
  bool getStartedLoading = true;

  Future<void> checkLogin(BuildContext context,
      {required String username, required String password}) async {
    isLoading = true;
    notifyListeners();
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username or Password should not be empty')));
      isLoading = false;
      notifyListeners();
    } else {
      try {
        var response = await repository.checkLogin(username, password);
      isLoading = false;
      notifyListeners();
      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.message ?? 'Success')));
        SharePreferenceHelper.setValue(
            SharePreferenceHelper.tokenKey, response.accessToken);
        SharePreferenceHelper.setValue(
            SharePreferenceHelper.refreshTokenKey, response.refreshToken);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }
      } catch (e) {
         isLoading = false;
      notifyListeners();
      }
      
    }
  }

  void checkUserLoggedState(BuildContext context) async {
    var token =
        await SharePreferenceHelper.getValue(SharePreferenceHelper.tokenKey);
    if (token != null && token.isNotEmpty) {
      getStartedLoading = false;
      notifyListeners();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please Login!')));
      getStartedLoading = false;
      notifyListeners();
    }
  }
}
