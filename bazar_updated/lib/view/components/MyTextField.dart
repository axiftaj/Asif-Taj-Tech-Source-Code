
import 'package:flutter/material.dart';



class MyTextField extends StatelessWidget {
   const MyTextField({
     Key? key,
    required this.myController,
    required  this.focusNode,
    required this.myValidator,
    required this.onChangeValue ,
    required this.onFiledSubmittedValue ,
    required this.keyBoardType,
    required this.obscureText,

  }) ;

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldValidator<String> myValidator ;
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
        style: Theme.of(context).textTheme.subtitle1 ,
        onFieldSubmitted: onFiledSubmittedValue ,
        decoration:  const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: onChangeValue ,
        validator: myValidator,

      ),
    );
  }
}
