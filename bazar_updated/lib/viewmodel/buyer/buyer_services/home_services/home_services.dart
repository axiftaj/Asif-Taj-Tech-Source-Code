import 'dart:convert';

import 'package:bazar_updated/model/buyer_model/products_model.dart';
import 'package:bazar_updated/view/utilz/app_url.dart';
import 'package:http/http.dart' as http;

class HomeServices {


  //api to get all browse, frequently order and order again products
  Future<ProductsModel>  getProductApi(String userId)async {

    final response = await http.get(Uri.parse(AppUrls.buyerDashBoardUrl+userId));

    var data = json.decode(response.body.toString());

    if(response.statusCode == 200){
      return  ProductsModel.fromJson(data);
    }else {
      return  ProductsModel.fromJson(data);

    }
  }
}