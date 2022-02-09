class BuyerUserModel {


  int userId;
  String username;
  String phone;
  String userType ;
  String address ;

  BuyerUserModel({required this.userId ,required  this.username ,required this.phone , required this.userType, required this.address}) ;


  factory BuyerUserModel.fromJson(Map<String, dynamic> responseData) {
    return BuyerUserModel(
      userId: responseData['userId'],
      username: responseData['username'],
      phone: responseData['phone'],
      userType: responseData['usertype'],
      address: responseData['address'],
    );
  }
}