class UserModel {


  int userId;
  String username;
  String phone;
  String userType ;
  String address ;

  UserModel({required this.userId ,required  this.username ,required this.phone , required this.userType, required this.address}) ;


  factory UserModel.fromJson(Map<String, dynamic> responseData) {
    return UserModel(
      userId: responseData['userId'],
      username: responseData['username'],
      phone: responseData['phone'],
      userType: responseData['usertype'],
      address: responseData['address'],
    );
  }
}