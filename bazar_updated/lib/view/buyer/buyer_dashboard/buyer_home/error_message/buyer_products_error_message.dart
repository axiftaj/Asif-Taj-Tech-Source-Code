import 'package:flutter/material.dart';

class BuyerErrorMessageWidget extends StatefulWidget {
  const BuyerErrorMessageWidget({Key? key}) : super(key: key);

  @override
  _BuyerErrorMessageWidgetState createState() => _BuyerErrorMessageWidgetState();
}

class _BuyerErrorMessageWidgetState extends State<BuyerErrorMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        TextButton(onPressed: (){
          setState(() {
          //  homeServices.getProductApi(snap.data!.userId.toString());
          });
        }, child:const Padding(
          padding:  EdgeInsets.only(top: 16),
          child: Text('Try Again: '),
        ))

      ],
    );
  }
}
