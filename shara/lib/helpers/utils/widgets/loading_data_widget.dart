import 'package:flutter/material.dart';
import 'package:shara/helpers/utils/widgets/loading_indicator.dart';

class LoadingDataWidget extends StatelessWidget {

  final isLoading;
  final Widget child;

  LoadingDataWidget({Key key,@required this.isLoading,@required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isLoading ? SizedBox() : child,
        isLoading ? Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.1),
            child: Center(child: LoadingIndicatorWidget())) : SizedBox()
      ],
    );
  }
}
