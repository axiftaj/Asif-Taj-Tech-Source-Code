import 'dart:ui';

import 'package:bazar_updated/model/user_model.dart';
import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:bazar_updated/view/utilz/constants.dart';
import 'package:bazar_updated/viewmodel/buyer/buyer_shared_preference/buyer_shared_preference.dart';
import 'package:bazar_updated/viewmodel/localization/language/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({Key? key}) : super(key: key);

  @override
  _BuyerHomeScreenState createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {

  TextEditingController searchController = TextEditingController();
  String searchString = '';
  String address = "" ;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop() ;
        return true ;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    children :<Widget>[
                      Image(
                        fit: BoxFit.cover,
                        image: AssetImage("images/dashboard_image.png"),
                        height: MediaQuery.of(context).size.height * 0.27,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.27,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.0),
                            ],

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04 ,
                            ),
                            Text(Languages.of(context)!.welcomeToBazar , style: const TextStyle(color: Colors.white ,fontFamily: aHeavy , fontSize: 28 ),),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.room , color: Colors.white,size: 12,),
                                const SizedBox(width: 5,),
                                FutureBuilder<UserModel>(
                                  future: BuyerUserPreferences().getUser() ,
                                    builder: (context, snapshot){
                                      if(!snapshot.hasData){
                                        return  const Expanded(
                                            child: Text( "Panama City Panama",
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,  textAlign: TextAlign.start,maxLines: 2, style:  TextStyle(color: Colors.white ,fontFamily: aRoman , fontSize: 12 ),));

                                      }else {
                                       return  Expanded(child: Text(snapshot.data!.address.toString(), overflow: TextOverflow.ellipsis,
                                         softWrap: false,  textAlign: TextAlign.start,maxLines: 2, style: const TextStyle(color: Colors.white ,fontFamily: aRoman , fontSize: 12 ),));

                                    }
                                    }),

                              ],
                            ),
                            const SizedBox(
                              height: 15 ,
                            ),
                            ClipRect(
                              child: BackdropFilter(
                                filter:  ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                                child: Container(
                                  height: 50.0,
                                  decoration : BoxDecoration(
                                      color: const Color(0xff61574A).withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top :  5.0 , left: 20 , right: 20),
                                    child: TextFormField(
                                      cursorColor: MyColors.primaryColor,
                                      controller: searchController,
                                      style:  const TextStyle(
                                          fontFamily: aHeavy,
                                          fontSize: 16,
                                          color: Color(0xff8F92A1)
                                      ),
                                      onChanged: (value){
                                        setState(() {
                                          searchString = value ;
                                        });
                                      },
                                      decoration:  InputDecoration(
                                        contentPadding: const
                                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                                        hintText: Languages.of(context)!.searchForSomeThing,
                                        prefixIcon: Icon(Icons.search , color: const Color(0xffffffff).withOpacity(0.6),),
                                        hintStyle: TextStyle(color: const Color(0xffFFFFFF).withOpacity(0.6) ,fontFamily: aRoman ),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
