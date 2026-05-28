import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';

class DropDownWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;

  final TextEditingController controller;

  final int maxLines;

  DropDownWidget(
      {Key? key,
      this.maxLines = 1,
      this.hintText,
      this.labelText,
      required this.controller})
      : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  List<String> options = <String>['One', 'Two', 'Free', 'Four'];
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: TextFormField(
            controller: widget.controller,
            maxLines: widget.maxLines,
            onTap: () {},
            style: TextStyle(color: AppColors.mainLightGreyColor),
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.borderTextFieldColor,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      // color: Colors.red
                      color: AppColors.borderTextFieldColor,
                    )),
                fillColor: Colors.white,
                filled: true,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: AppColors.mainLightGreyColor,
                    backgroundColor: Colors.white),
                label: widget.labelText != null ? Text(
                        widget.labelText!,
                        style: TextStyle(
                            color: AppColors.mainLightGreyColor,
                            backgroundColor: Colors.white,
                            fontSize: 20),
                      ) : null,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 40,
                    color: AppColors.borderTextFieldColor,
                  ),
                )),
            // validator: (value){
            //        return value == '' ? '' : null;
            // },
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 0,
                blurRadius: 1,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            width: double.infinity,
            color: Colors.white.withValues(alpha: 0.000001)
          ),
        )
      ],
    );
  }
}
