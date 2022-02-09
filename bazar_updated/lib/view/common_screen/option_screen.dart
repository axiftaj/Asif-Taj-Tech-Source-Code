import 'package:bazar_updated/view/utilz/CustomIcons/custom_icons.dart';
import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:bazar_updated/viewmodel/localization/language/languages.dart';
import 'package:flutter/material.dart';


class OptionScreen extends StatelessWidget {

  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('images/bazar_logo.png')),
              ReusableLoginOptionContainer(userTitle: Languages.of(context)!.iAmAbUYER , description: Languages.of(context)!.startShoppingRightAway , userIcon: Custom.buyerIcon , onPress: (){
                //Navigator.pushNamed(context, BuyerSignUpScreen.id);
              },),
              const SizedBox(
                height: 20,
              ),
              ReusableLoginOptionContainer(userTitle: Languages.of(context)!.iAmSeller, description: Languages.of(context)!.continueToSellerBazar , userIcon: Custom.buyerIcon , onPress: (){
              //  Navigator.pushNamed(context, SellerSignUpScreen.id);

              },),

            ],
          ),
        ),
      ),
    );
  }

}

class ReusableLoginOptionContainer extends StatelessWidget {

   ReusableLoginOptionContainer({required this.userTitle  ,required this.description,required this.userIcon ,required this.onPress});

  final String userTitle ;
  final String description ;
  final IconData userIcon ;
  final VoidCallback onPress ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(

        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
          child: Row(

            children: [
              Container(
                decoration: BoxDecoration(
                    color: MyColors.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    userIcon ,
                    color: MyColors.primaryColor,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userTitle , style: TextStyle(color: Colors.black , fontFamily: 'Avenir Book' , fontSize: 16),),
                  Text(description , style: TextStyle(color: Color(0xff8F92A1) , fontFamily: 'Avenir Roman' , fontSize: 12),),

                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined ,
                color: MyColors.primaryColor,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
