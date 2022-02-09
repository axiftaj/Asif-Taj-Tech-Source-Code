import 'package:bazar_updated/model/buyer_model/buyer_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class BuyerUserPreferences {

  Future<bool> saveUser(BuyerUserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.userId);
    prefs.setString("username", user.username);
    prefs.setString("phone", user.phone);
    prefs.setString("usertype", user.userType);
    prefs.setString("address", user.address);

    return true;
  }

  Future<BuyerUserModel> getUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId") ?? -1;
    String userName = prefs.getString("username")?? "";
    String phone = prefs.getString("phone") ?? "";
    String userType = prefs.getString("usertype") ?? "";
    String address = prefs.getString("address") ?? "";


    return BuyerUserModel(
      userId: userId,
      username: userName,
      phone: phone,
      userType: userType,
      address: address,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("userId");
    prefs.remove("username");
    prefs.remove("phone");
    prefs.remove("usertype");
    prefs.remove("address");

  }

// Future<String> getToken(args) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString(args) ??;
//   return token;
// }
}