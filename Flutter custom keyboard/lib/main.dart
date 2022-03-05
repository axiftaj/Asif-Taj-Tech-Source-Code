import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  TextEditingController _controller = TextEditingController();
  bool _readOnly = true;
  String id = "" ;
  String name = "" , phone ="" , url = "" ;
  bool showSpinner = false ;
  String searchQuery = "" ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30 , horizontal: 5),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Padding(
                padding: EdgeInsets.only(left : MediaQuery.of(context).size.width * .07 , right:  MediaQuery.of(context).size.width * .07 , bottom:  MediaQuery.of(context).size.width * .03 , top:  MediaQuery.of(context).size.width * .03 ),
                child: Padding(
                  padding: const EdgeInsets.only(top :  5.0 , left: 20 , right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
                    onChanged: (String value){

                      setState(() {
                        searchQuery == value.toString();
                      });
                    },

                    readOnly: _readOnly,
                    controller: _controller,

                    decoration: const  InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),

                  ),
                ),
              ),

              Spacer(),
              CustomKeyboard(
                onTextInput: (myText) {
                  _insertText(myText);
                },
                onBackspace: () {
                  _backspace();
                },
                onPress: (){
                  if(_controller.text.isEmpty){
                  }else {
                    searchQuery = _controller.text.toString() ;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.

    if(textSelection.start == 1){

    }
    if (textSelection.start == 0) {

      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({
    required this.onTextInput,
    required this.onBackspace,
    required this.onPress
  }) ;

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onPress;

  void _textInputHandler(String text) => onTextInput?.call(text);

  void _backspaceHandler() => onBackspace?.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),

      ),
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
          buildRowFive(),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '1',
            text2: "",
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            text2: 'ABC',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            text2: "DEF",
            onTextInput: _textInputHandler,
          ),

          TextKey(
            text: '@',
            text2: "",
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '4',
            text2: "GHI",
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '5',
            text2: "JKL",
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            text2: "MNO",
            onTextInput: _textInputHandler,
          ),

          TextKey(
            text: '/',
            text2: "",
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '7',
            text2: 'PQRS',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            text2: 'TUV',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            text2: 'WXYZ',
            onTextInput: _textInputHandler,
          ),

          TextKey(
            text: '-',
            text2: "",
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '*',
            text2: '',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '0',
            text2: '',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '#',
            text2: "",
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '.',
            text2: "",
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFive() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex : 1 ,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap:onPress,
                  child: Center(
                    child: Text('HOME' ,  style: TextStyle(fontSize: 15 ,  )),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex : 1 ,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap:onPress,
                  child: Center(
                    child: Text('CALL' ,  style: TextStyle(fontSize: 15 , )),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAlias,

                child: InkWell(
                  onTap: () {
                    onBackspace?.call();
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Icon(Icons.backspace_outlined)),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex : 1 ,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap:onPress,
                  child: Container(
                    child: Center(
                      child: Text('ENTER' ,  style: TextStyle(fontSize: 15  )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    required this.text,
    required this.onTextInput,
     this.flex = 1,
    required this.text2
  }) ;

  final String text;
  final String text2 ;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            onTap: () {
              onTextInput?.call(text);
            },
            child: Container(
              child: Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text2 , style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,), ),
                  Text(text , style : TextStyle(fontSize: 25, fontWeight: FontWeight.bold,) ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({

   required this.onBackspace,
    this.flex = 1,
  }) ;

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          child: InkWell(
            onTap: () {
              onBackspace?.call();
            },
            child: Container(

              child: Center(
                child: Icon(Icons.backspace),
              ),
            ),
          ),
        ),
      ),
    );
  }
}