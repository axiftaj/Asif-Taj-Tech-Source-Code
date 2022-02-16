
class AppUrls {

  //domain url
  //   static const DomainURL =  "http://54.198.37.138:3000/api/v1/" ;


  // testing domain url
  static const domainUrl =  "http://54.198.37.138:6000/api/v1/" ;

  static const kGoogleApiKey = "AIzaSyBWTD-gxbm_lOv9WBmm9TwfrQ9IWEE3YJY";

  static const buyerPhoneNumberVerification =  domainUrl+'auth/phone_verification' ;
  static const buyerCodeVerification =  domainUrl+'auth/code_verification' ;
  static const resendCode =  domainUrl+'auth/resendcode' ;
  static const logout =  domainUrl+'user/logout/' ;


  static const loginUrl =  domainUrl+'auth/login' ;
  static const signUpURL =  domainUrl+'auth/signup' ;
  static const updateProfile =  domainUrl+'user/update' ;

  //forgot password apis
  static const forgotPasswordVerifyNumber =  domainUrl+'auth/forgot_password' ;
  static const resendPassword =  domainUrl+'auth/resendcode' ;
  static const rsetPassword =  domainUrl+'auth/reset_password' ;

  //buyer url  url ;
  static const buyerDashBoardUrl =  domainUrl+'buyer/dashboard/' ;
  static const itemStatisticUrl =  domainUrl+'app/itemstatistic/' ;
  static const KBuyerPlaceOrderUrl =  domainUrl+'buyer/order' ;
  static const KBuyerAddressUrl =  domainUrl+'buyer/newaddress' ;
  static const KBuyerUpComingUrl =  domainUrl+'buyer/upcoming/' ;
  static const KGetBuyerAddressUrl =  domainUrl+'app/getaddress/' ;
  static const KGetBuyerBidDetailUrl =  domainUrl+'buyer/getbiddetails' ;
  static const KGetBuyerOrderHistorylUrl =  domainUrl+'buyer/history/' ;
  static const KBuyerGiveReviewUrl =  domainUrl+'buyer/addreview' ;
  static const KBuyerInvoiceUrl =  domainUrl+'buyer/invoicehistory/' ;


  static const KSendEmail =  domainUrl+'buyer/sendemail/' ;

  static const KBuyerProfile =  domainUrl+'user/getprofile/' ;

  //waiting for confirmation api
  static const KGetWaitingForConfirmationUrl =  domainUrl+'buyer/waiting/' ;
  static  const KGetBuyerInNegotiationUrl =  domainUrl+'buyer/negotiation/' ;

  //seller  url ;
  static  const KSellerCategoriesUrl =  domainUrl+'app/getcategories' ;
  static  const KSellerDeleteCategory =  domainUrl+'seller/deletecategory' ;
  static  const KSellerSaveCategoriesUrl =  domainUrl+'app/savecategories' ;
  static  const KSellerGetSaveCategoriesUrl =  domainUrl+'seller/getcategories/' ;
  static const KSellerGetRequestUrl =  domainUrl+'seller/getrequests/' ;
  static const KSellerAcceptOrderUrl =  domainUrl+'seller/acceptorder' ;
  static  const KSellerSellingCartUrl =  domainUrl+'seller/sellingcart/' ;
  static  const KSellerSendToQASUrl =  domainUrl+'seller/senttoqas/' ;
  static  const KSellerPendingOrdersUrl =  domainUrl+'seller/pending/' ;
  static  const KSellerPendingOrdersDetailUrl =  domainUrl+'seller/orderdetails/' ;
  static const KSellerOrderHistoryUrl =  domainUrl+'seller/history/' ;
  static const KSellerInNegotiationUrl =  domainUrl+'seller/negotiation/' ;


  //seller bid api
  static const KSellerPlaceBidUrl =  domainUrl+'seller/bidprice' ;
  static  const KBuyerAcceptBidUrl =  domainUrl+'seller/acceptbid' ;
  static   const KBuyerRejectBidUrl =  domainUrl+'seller/rejectbid' ;


  //seller order status url
  static  const KSellerOderStatusPendingReviewUrl =  domainUrl+'seller/pendingreview/' ;
  static const KSellerReviewedOrderUrl =  domainUrl+'seller/reviewed/' ;


  //qas url
  static  const KGetQASOrderUrl = domainUrl+'qas/getorders' ;
  static  const KGetQASOrderDetailUrl =  domainUrl+'qas/getspecificorder/' ;
  static  const KGetQASAcceptUrl =  domainUrl+'qas/accept' ;
  static  const KGetQASeller =  domainUrl+'qas/getsellers' ;
  static  const qasChangeOrder =  domainUrl+'qas/changeOrder' ;
  static  const qasChangeTone =  domainUrl+'qas/changetona' ;


  //pds url
  static  const KGetPDSOrderUrl =  "$domainUrl"+'pds/getorders' ;
  static  const KGetPDSOrderDetailUrl =  "$domainUrl"+'pds/getspecificorder/' ;
  static  const KGetPDSAcceptUrl =  "$domainUrl"+'pds/accept' ;

}