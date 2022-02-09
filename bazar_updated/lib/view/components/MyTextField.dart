
import 'package:flutter/material.dart';



class MyTextField extends StatelessWidget {
   const MyTextField({
     Key? key,
    required this.myController,
    required  this.focusNode,
    required this.onChangeValue ,
    required this.onFiledSubmittedValue ,
    required this.keyBoardType,
    required this.obscureText,

  }) ;

  final TextEditingController myController;
  final FocusNode focusNode;
  final ValueChanged<String> onChangeValue ;
  final FormFieldSetter onFiledSubmittedValue ;
  final TextInputType keyBoardType ;
  final bool obscureText ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( left: 15 , right: 20),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyBoardType,
        controller: myController,
        focusNode: focusNode,
        style: Theme.of(context).textTheme.headline6!.copyWith(color: Color(0xff2D3142)) ,
        onFieldSubmitted: onFiledSubmittedValue ,
        decoration:   InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
          hintStyle: Theme.of(context).textTheme.headline6,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: onChangeValue ,

      ),
    );
  }
}
