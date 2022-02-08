import 'package:bazar_updated/view/components/round_button.dart';
import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:bazar_updated/view/utilz/general_utilities.dart';
import 'package:bazar_updated/viewmodel/localization/language/languages.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController phoneNumberController = TextEditingController() ;
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    phoneNumberController.dispose();
    passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Languages.of(context)!.signInFor , style: Theme.of(context).textTheme.headline1),
                      Text(Languages.of(context)!.bazar , style: Theme.of(context).textTheme.headline1!.copyWith(color: MyColors.primaryColor),),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 20 ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(Languages.of(context)!.phoneNumber , style: TextStyle(color: Color(0xff8F92A1) , fontSize: 14 , fontFamily: AvenirRoman) ,),
                              GeneralUtilities.height(4.0),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff8F92A1).withOpacity(0.1) ,
                                  borderRadius: BorderRadius.circular(16) ,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff4075CD).withOpacity(0.07),
                                      spreadRadius: 5,
                                      blurRadius: 20,
                                      offset: Offset(0, 10), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: CountryCodePicker(
                                        onChanged: (e) {
                                          _countryCode = e.dialCode.toString().trim() ;
                                        },
                                        initialSelection: 'PA',
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: false,
                                        favorite: ['+507', 'PAN'],
                                        textStyle: TextStyle(color: Color(0xff2D3142) , fontSize: 16 , fontFamily: AvenirRoman),
                                        showDropDownButton: false,
                                        boxDecoration: BoxDecoration(
                                          color: Colors.white ,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 10 ,
                                      child: TextFormField(
                                        controller: phoneNumberController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          hintText: '1234567890',
                                          hintStyle: TextStyle(color: Color(0xff2D3142) , fontFamily: AvenirRoman , fontSize: 16) ,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                        validator: (String? value){
                                          return value!.isEmpty ? Languages.of(context)!.enterPhoneNumber : null ;
                                        },
                                        onChanged: (value){

                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                             GeneralUtilities.height(10.0),
                              Text(Languages.of(context)!.password , style: TextStyle(color: Color(0xff8F92A1) , fontSize: 14 , fontFamily: AvenirRoman) ,),
                              GeneralUtilities.height(10.0),

                              Container(
                                decoration : BoxDecoration(
                                    color: Color(0xff8F92A1).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: MyTextField(
                                        keyBoardType: TextInputType.text,
                                        myController: passwordController,
                                        focusNode: _passwordFocusNode,
                                        obscureText: _obscureText,
                                        myValidator: (String? value) {
                                          return value.isEmpty
                                              ? Languages.of(context).enterPassword
                                              : null;
                                        },
                                        onChangeValue: (value){
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        _toggle() ;
                                      },
                                      child: Icon( _obscureText == false ? Icons.visibility :  Icons.visibility_off,
                                        color: Color(0xff8F92A1),
                                      ),
                                    ),
                                    SizedBox(width: 15,)

                                  ],
                                ),
                              ),
                              GeneralUtilities.height(5.0),


                            ],
                          ),
                        ),

                        GeneralUtilities.height(25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: ()async {
                               //   Navigator.pushNamed(context, ForgotPasswordVerifyNumberScreen.id);
                                },
                                child: Text(Languages.of(context)!.forgotPassword ,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: KPrimaryTextColor , fontSize: 14 , fontFamily:  AvenirHeavy,),))
                          ],
                        ),

                        GeneralUtilities.height(20.0),
                        RoundButton(onPressed: () async {

                          if(_formKey.currentState!.validate()){

                            var connectivityResult = await (Connectivity().checkConnectivity());
                            if (connectivityResult == ConnectivityResult.none) {
                              GeneralUtilities.toastMessage('please check your internet connection');
                            }else if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
                              // I am connected to a wifi network.

                            }

                          }
                        } , title: Languages.of(context)!.login,),
                        GeneralUtilities.height(5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(Languages.of(context).dontHaveAnAccount , style: TextStyle(color: Color(0xff8F92A1) , fontSize: 14 , fontFamily:  AvenirRoman,),),
                            GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, LoginTypeScreen.id);
                                },
                                child: Text(Languages.of(context).signUp ,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: KPrimaryColors , fontSize: 14 , fontFamily:  AvenirHeavy,),))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          decoration: new BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: KPrimaryColors
                              ),
                              borderRadius: BorderRadius.circular(50)

                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Container(
                                    height: 50,
                                    width: 80,
                                    decoration:  BoxDecoration(
                                      color: Languages.of(context).labelSelectLanguage == "Seleccione el idioma" ? KPrimaryColors : null,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50)
                                      ),

                                    ),
                                    child: Center(child: Text('Spanish' ,
                                      style: TextStyle(
                                        color: Languages.of(context).labelSelectLanguage == "Seleccione el idioma"? Colors.white : Colors.red ,

                                      ),
                                    ))),
                                onTap: (){
                                  changeLanguage(context, 'es');
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                    height: 50,
                                    width: 80,
                                    decoration: new BoxDecoration(
                                      color: Languages.of(context).labelSelectLanguage == 'Select Language' ? KPrimaryColors : null,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50),
                                          bottomRight: Radius.circular(50)
                                      ),

                                    ),
                                    child: Center(child: Text('English' ,
                                      style: TextStyle(
                                        color: Languages.of(context).labelSelectLanguage == 'Select Language' ? Colors.white : KPrimaryColors ,
                                      ),

                                    ))),
                                onTap: (){
                                  changeLanguage(context, 'en');
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
