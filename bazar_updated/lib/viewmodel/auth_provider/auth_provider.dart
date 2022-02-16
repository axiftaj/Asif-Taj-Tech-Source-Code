import 'dart:convert';
import 'dart:io';

import 'package:bazar_updated/model/user_model.dart';
import 'package:bazar_updated/view/utilz/app_url.dart';
import 'package:bazar_updated/view/utilz/general_utilities.dart';
import 'package:bazar_updated/view/utilz/route_name.dart';
import 'package:bazar_updated/viewmodel/auth_provider/show_spinner_provider.dart';
import 'package:bazar_updated/viewmodel/buyer/buyer_shared_preference/buyer_shared_preference.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
class AuthProvider with ChangeNotifier {

  void loginApi(String phoneNumber, String password, BuildContext context) async {
    final spinner = Provider.of<ShowSpinner>(context , listen: false);

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    spinner.setSpinner(true);


    String  deviceType = 'android' , token = "";
    if(Platform.isIOS){
      deviceType = 'ios' ;
    }else {
      deviceType = 'android' ;
    }

    try {


      await _firebaseMessaging.getToken().then((value){
        token = value.toString();
      });


      Response response = await post(Uri.parse(AppUrls.loginUrl),
          body: {
            "phone": phoneNumber.trim(),
            "password": password.trim(),
            "device_id": token,
            "device_type": deviceType.toString().trim(),
          }
      );


      Map<String, dynamic> data = jsonDecode(response.body.toString()) ;

   //   print(data);

      if( response.statusCode == 200){

        spinner.setSpinner(false );

        if(data['success'] == true ){


          if(data['message'] == 'Your user needs authentication by administration, please try in 30 minutes'){
            GeneralUtilities.toastMessage(data['message']) ;
          }
          else if(data['data']['user_type'] == 'buyer'){

            if(data['message'] == 'Please Complete Your Profile'){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => BuyerCompleteProfileScreen()),
              // );
              GeneralUtilities. toastMessage(data['message']);

            }else {


              UserModel authUser = UserModel(
                userId: data['data']['id'] ,
                phone: data['data']['phone'] ,
                  address: data['data']['address'] == "" ? "XYZ address" : data['data']['address'][0]['location']  ,
                  userType: data['data']['user_type'],
                  username: data['data']['name']
              );

              BuyerUserPreferences().saveUser(authUser);

              Navigator.pushNamed(context, RouteName.buyerDashboard);

            }

          }else  if ( data['data']['user_type'] == 'seller'){

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SellerDashBoardScreen()),
            // );
          }
          else  if ( data['data']['user_type'] == 'pds'){

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => PDSScreen()),
            // );

          }else  if ( data['data']['user_type'] == 'qas'){


            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => QASScreen()),
            // );

          }



        }else {

          spinner.setSpinner(false );

          if(data['message'] == "Details Not Found"){
            GeneralUtilities.toastMessage('Details Not Found') ;
          }else {
            GeneralUtilities.toastMessage(data['message']) ;
          }

        }
      }else {

        spinner.setSpinner(false );

        if(data['message'] == "Details Not Found"){
          GeneralUtilities.toastMessage('Your account is not enabled.') ;
        }else {
          GeneralUtilities.toastMessage(data['message']) ;
        }

      }
    }catch (e){
      spinner.setSpinner(false );
      print('exception');
      print(e.toString());

    }

  }
}