import 'dart:ui';

import 'package:bazar_updated/model/user_model.dart';
import 'package:bazar_updated/view/buyer/buyer_dashboard/buyer_home/error_message/buyer_products_error_message.dart';
import 'package:bazar_updated/view/buyer/buyer_dashboard/buyer_home/view_all_products.dart';
import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:bazar_updated/view/utilz/constants.dart';
import 'package:bazar_updated/viewmodel/buyer/buyer_services/home_services/home_services.dart';
import 'package:bazar_updated/viewmodel/buyer/buyer_shared_preference/buyer_shared_preference.dart';
import 'package:bazar_updated/viewmodel/localization/language/languages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bazar_updated/model/buyer_model/products_model.dart';
import 'package:shimmer/shimmer.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({Key? key}) : super(key: key);

  @override
  _BuyerHomeScreenState createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {

  bool show1 = false;
  bool show2 = false;

  TextEditingController searchController = TextEditingController();
  String searchString = '';
  String address = "" ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 400),(){setState(() {show1 = true;});});
    Future.delayed(Duration(milliseconds: 600),(){setState(() {show2 = true;});});

  }
  @override
  Widget build(BuildContext context) {
    HomeServices homeServices = HomeServices();
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
              ),
              FutureBuilder<UserModel>(
                future: BuyerUserPreferences().getUser(),
                  builder: (context, snap){
                if(!snap.hasData){
                  return Text("");
                }else {
                 return  Expanded(
                    child: ListView(
                      children: [
                        Visibility(
                            visible: searchController.text.isEmpty ? true :  false,
                            child: ReusableRowTitle(title: Languages.of(context)!.frequentlyOrder, onPress: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ViewAllProductsScreen(
                                    name: 'frequently_ordered',
                                  ),),
                              );
                            })),
                        Visibility(
                          visible: searchController.text.isEmpty ? true :  false,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              color: Colors.transparent,
                              child: FutureBuilder(
                                future: homeServices.getProductApi(snap.data!.userId.toString()),
                                builder: (BuildContext context, AsyncSnapshot<ProductsModel> snapshot) {

                                  if(snapshot.hasData){
                                    return   ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder: (context, index){
                                          return Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor: Colors.grey.shade100,
                                              child: Container(
                                                width : MediaQuery.of(context).size.width * 0.35,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                ),
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    CachedNetworkImage(
                                                      fit: BoxFit.fill,
                                                      height: MediaQuery.of(context).size.height * 0.15,
                                                      width: MediaQuery.of(context).size.width * 0.25,
                                                      placeholder: (context, url) => Container(height: 15 ,width: 15, child: Center(child: const CircularProgressIndicator())),
                                                      errorWidget: (context, url, error) => Center(child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(Icons.error , color: MyColors.primaryColor,),
                                                          SizedBox(height: 10,),
                                                          Text('Error')
                                                        ],
                                                      )), imageUrl: 'adsf'
                                                        'adf',
                                                    ),

                                                    Text("asdf" ,overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,  textAlign: TextAlign.center, style: TextStyle(color: Color(0xff01000D) , fontSize: 15 , fontFamily: aBook),)

                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                  else if(snapshot.hasError){
                                    return const BuyerErrorMessageWidget();
                                  }
                                  else if (snapshot.data!.data!.frequentlyOrdered!.isEmpty == 0) {
                                    return const Center(
                                      child: Text("No frequently order"),
                                    );
                                  } else {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.data!.frequentlyOrdered!.length,
                                      itemBuilder: (context, index) {
                                        return ReusableContainer(
                                          name: snapshot.data!.data!.frequentlyOrdered![index].category.toString(),
                                          image: snapshot.data!.data!.frequentlyOrdered![index].categoryImage.toString() ,
                                          onPress: (){
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => ItemDetails(
                                            //       productId: snapshot.data[index].category_id,
                                            //       productName: snapshot.data[index].category,
                                            //       productImage: snapshot.data[index].category_image,
                                            //     ),),
                                            // );
                                          },
                                        );
                                      },
                                    ) ;
                                  }

                                },
                              ),),
                          ),
                        ),
                      ],
                    ),
                  ) ;

                }
              })
            ],
          ),
        ),
      ),
    );
  }
}



class ReusableContainer extends StatelessWidget {

  const ReusableContainer({required this.name ,required this.image ,required this.onPress});

  final String name ;
  final String image ;
  final VoidCallback onPress ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width : MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.25,
                  placeholder: (context, url) => Container(height: 15 ,width: 15, child: Center(child: const CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error , color: MyColors.primaryColor,),
                      SizedBox(height: 10,),
                      Text('Error')
                    ],
                  )),
                  imageUrl: image),

              Text(name ,overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,  textAlign: TextAlign.center, style: TextStyle(color: Color(0xff01000D) , fontSize: 15 , fontFamily: aBook),)

            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRowTitle extends StatelessWidget {
  const ReusableRowTitle({required this.title ,required this.onPress});

  final String title ;
  final VoidCallback onPress ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
      child: Row(
        children: [
          Text(title , style: TextStyle(color: Colors.black , fontFamily: aHeavy , fontSize: 18),),
          Spacer(),
          GestureDetector(
              onTap: onPress,
              child: Text(Languages.of(context)!.seeAll , style: TextStyle(color: MyColors.primaryColor , fontFamily: aRoman , fontSize: 14),))

        ],
      ),
    );
  }
}
