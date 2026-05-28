

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'custom_text_form_field.dart';

class FourDigitWidget extends StatefulWidget {


  final List<TextEditingController> textControllers;
  final bool isPassword;

   FourDigitWidget({Key? key,required this.textControllers,this.isPassword = false}) : super(key: key);

  @override
  State<FourDigitWidget> createState() => _FourDigitWidgetState();
}

class _FourDigitWidgetState extends State<FourDigitWidget> {


  FocusNode _focusNode1 = FocusNode();

  FocusNode _focusNode2 = FocusNode();

  FocusNode _focusNode3 = FocusNode();

  FocusNode _focusNode4 = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.requestFocus();

  }


  @override
  Widget build(BuildContext context) {
    if(widget.textControllers[0].text.isEmpty && widget.textControllers[1].text.isEmpty && widget.textControllers[2].text.isEmpty && widget.textControllers[3].text.isEmpty){
      _focusNode1.requestFocus();
    }
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // RawKeyboardListener( focusNode: _focusNode1,
          //     onKey: (e){
          //       println('------ e $e}');
          //     }, child: SizedBox(width: 0,)),
          Container(
              width: 60,
              height: 60,

              child: CustomTextFormField(
                textAlign: TextAlign.center,
                controller: widget.textControllers[0],
                keyboardType: TextInputType.number,
                focusNode: _focusNode1,
                secureText: widget.isPassword,
                inputFormatters:  [
                  LengthLimitingTextInputFormatter(1),
                ],
                onChange: (value){

                  if(value.isNotEmpty){
                    FocusScope.of(context).requestFocus(_focusNode2);
                  }
                },

              )
          ),
          Container(
              width: 60,
              height: 60,
              child: CustomTextFormField(
                textAlign: TextAlign.center,
                controller: widget.textControllers[1],
                secureText: widget.isPassword,
                focusNode: _focusNode2,
                onChange: (value){

                  if(value.isNotEmpty){
                    FocusScope.of(context).requestFocus(_focusNode3);
                  }else if(widget.textControllers[1].text.isEmpty){
                    FocusScope.of(context).requestFocus(_focusNode1);
                  }
                },
                inputFormatters:  [
                  LengthLimitingTextInputFormatter(1),
                ],
                keyboardType: TextInputType.number,
                // decoration: InputDecoration(
                //
                // ),
              )),
          Container(
              width: 60,
              height: 60,
              child: CustomTextFormField(
                textAlign: TextAlign.center,
                focusNode: _focusNode3,
                controller: widget.textControllers[2],
                secureText: widget.isPassword,
                inputFormatters:  [
                  LengthLimitingTextInputFormatter(1),
                ],
                onChange: (value){
                  if(value.isNotEmpty) {
                    FocusScope.of(context).requestFocus(_focusNode4);
                  }else if(widget.textControllers[2].text.isEmpty){
                    FocusScope.of(context).requestFocus(_focusNode2);
                  }
                },
                keyboardType: TextInputType.number,
                // decoration: InputDecoration(
                //
                // ),
                //   inputFormatters:  [
                //     LengthLimitingTextInputFormatter(1),
                //   ]
              )),
          Container(
              width: 60,
              height: 60,
              child: CustomTextFormField(
                textAlign: TextAlign.center,
                inputFormatters:  [
                  LengthLimitingTextInputFormatter(1),
                ],
                controller: widget.textControllers[3],
                secureText: widget.isPassword,
                focusNode: _focusNode4,

                onChange: (String value){

                  if(value.isNotEmpty){
                    // FocusScope.of(context).unfocus();
                  }else if(widget.textControllers[3].text.isEmpty){
                    FocusScope.of(context).requestFocus(_focusNode3);
                  }
                },
                keyboardType: TextInputType.number,
                // decoration: InputDecoration(
                //
                // ),
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();

    super.dispose();
  }
}

