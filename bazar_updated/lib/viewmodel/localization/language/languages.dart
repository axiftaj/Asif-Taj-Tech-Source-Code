import 'package:flutter/material.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get printInvoice ;

  String get labelSelectLanguage ;

  String get signInFor ;

  String get bazar  ;

  String get phoneNumber ;

  String get password;

  String get forgotPassword ;

  String get login ;

  String get dontHaveAnAccount ;

  String get signUp ;

  String get enterPhoneNumber ;

  String get enterPassword ;

  String get checkInternet;

  // Option Screen Text
  String get iAmAbUYER ;

  String get startShoppingRightAway ;

  String get iAmSeller  ;

  String get continueToSellerBazar ;

  // signup screen text
  String get signUpForBazar ;

  String get policyCheck;

  String get verify ;

  String get agreeWithTOS ;

  String get numberAlreadyExists;

  //verification code screen
  String get verifyYourNumber ;

  String get weJustSendNewCode ;

  String get sendMeNewCode ;

  String get continueText ;

  String get enterSixDigitCode  ;

  String get enterVerificationCode ;

  String get completeYourProfile ;

  String get chooseLocation ;

  String get pickLocation ;

  String get commercialName ;

  String get companyName ;

  String get companyID ;

  String get email ;

  String get confirmEmail ;

  String get contact ;

  String get name ;

  String get lastName ;

  String get storeDescription ;

  String get buildingDescription ;

  String get enterName ;

  String get saveAndContinue ;

  String get confirmPassword ;

  String get enterConfirmPassword ;

  String get plaeaseChooseYourLocation;

  String get passwordNotMatched;

  String get address ;

  String get selectItemYouWantToSell ;

  String get noCategoriesAdded ;

  String get pleaseSelectCategories ;

  String get frequentlyOrder;

  String get orderAgain ;

  String get browse ;

  String get seeAll ;

  String get welcomeToBazar ;

  String get searchForSomeThing ;

  String get enterValue ;

  String get bidPrice ;

  String get enterBiddingPrice ;
  String get enterQuantity ;

  String get enterProductDetail ;
  String get sellerTotalOrderPrice ;

  String get unableToGenerateInvoiceNow ;

  String get addToOrder ;

  String get itemDetails ;

  String get quantity ;

  String get pleaseEnterBiddingPruce ;

  String get pleaseEnteQuantity ;

  // active order screen text

  String get total;

  String get delivery ;

  String get checkOut;

  String get youtCartIsEmpty ;

  //checkout screen text
  String get myOrders ;

  String get deliveryAddress ;

  String get deliveryDate ;

  String get deliveryTime;

  String get orderDetails ;

  String get paymentDetails ;

  String get grossProduct ;

  String get subTotal ;

  String get commission ;

  String get placeOrder ;

  String get orderSuccessMessage ;

  String get selectDeliveryDate ;

  String get selectDeliveryTime  ;

  //seller tab bar text
  String get active ;

  String get waitingForConfirmation ;

  String get upcomming;

  String get upCommingOrder;

  String get inNegotation ;

  //profile screen text
  String get myProfile ;

  String get orderHistory  ;

  String get pendingOrder  ;

  String get payment  ;

  String get logout  ;


  //seller home text

  String get sellerDashboard  ;

  String get newOrders  ;

  String get selling ;

  //selller profile

  String get home ;

  String get orderStatus  ;

  String get priceHistory ;

  String get qasOk  ;

  String get printLabel  ;

  String get pound  ;

  String get unit  ;
}
