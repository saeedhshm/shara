import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shara/helpers/app_colors.dart';

class CustomTextFormField extends StatelessWidget {

  final String hintText;
  final String labelText;
  final String icon;
  final bool secureText;
  final String errorMessage;
  final TextEditingController controller;
  final bool isValideField;
  final int maxLines;
  final bool readOnly;
  final TextInputType keyboardType;
  final Function (String)onFieldSubmitted;
  final Function (String)onChange;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  List<TextInputFormatter> inputFormatters;

   FocusNode focusNode;

   CustomTextFormField({Key key,this.maxLines = 1,this.hintText,this.labelText,this.icon,this.secureText = false,this.isValideField = true,this.errorMessage,this.controller,this.keyboardType = TextInputType.text,this.onFieldSubmitted,this.onChange,this.readOnly = false,this.textCapitalization =  TextCapitalization.none,this.textAlign = TextAlign.start,this.focusNode,this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(

          child: TextFormField(
            controller: controller,
            // maxLength: 1,
            focusNode: focusNode,
            readOnly: readOnly,
            obscureText: secureText,
            maxLines: maxLines,
            keyboardType: keyboardType,
            textCapitalization:textCapitalization,
            onFieldSubmitted: onFieldSubmitted,
            // style: TextStyle(
            //   fontWeight: FontWeight.bold
            // ),
            onChanged: onChange,
            inputFormatters:inputFormatters,
            textAlign: textAlign,
            decoration: InputDecoration(

                focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),

                    borderSide: BorderSide(
                      color:isValideField ?  AppColors.borderTextFieldColor: Colors.red,

                    )),

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      // color: Colors.red
                      color:isValideField ? AppColors.borderTextFieldColor : Colors.red,
                    )),

                fillColor: Colors.white,
                filled: true,

                hintText: hintText,
                hintStyle: TextStyle(color: isValideField ? AppColors.mainLightGreyColor : Colors.red,backgroundColor: Colors.white),
                label:labelText == null ? null : Text(labelText,style: TextStyle(color:isValideField ? AppColors.mainLightGreyColor : Colors.red,backgroundColor: Colors.white),),
                suffixIcon:icon == null ? null : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(icon,height: 25,color:isValideField ?  AppColors.borderTextFieldColor : Colors.red,),
                )
            ),
            // validator: (value){
            //        return value == '' ? '' : null;
            // },
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 1,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
        ),
       isValideField ? SizedBox() : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(errorMessage,style: TextStyle(
            color: Colors.red,
            fontSize: 14
          ),),
        )
      ],
    );
  }
}
