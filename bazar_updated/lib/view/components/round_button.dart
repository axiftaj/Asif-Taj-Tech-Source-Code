import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  const RoundButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title ;
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: MyColors.primaryColor,
      borderRadius: BorderRadius.circular(8.0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        height: 45.0,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}