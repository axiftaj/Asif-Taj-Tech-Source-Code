
import 'dart:async';

import 'package:bazar_updated/model/buyer_model/buyer_user_model.dart';
import 'package:bazar_updated/view/utilz/route_name.dart';
import 'package:bazar_updated/viewmodel/buyer/buyer_shared_preference/buyer_shared_preference.dart';
import 'package:flutter/cupertino.dart';

class UserLogin  {

  void isUserLogin(BuildContext context)async{

    Future<BuyerUserModel> getUserData() => BuyerUserPreferences().getUser();

    getUserData().then((value) {

      if(value.userType == 'buyer'){
        Timer(
            const Duration(seconds: 3),
                () => Navigator.pushNamed(context , RouteName.buyerDashboard));
      }
    });
  }


}