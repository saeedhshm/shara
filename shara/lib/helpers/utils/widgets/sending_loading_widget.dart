import 'package:flutter/material.dart';
import 'package:shara/helpers/utils/widgets/loading_indicator.dart';

class SendingLoadingDataWidget extends StatelessWidget {

  final isLoading;
  final Widget child;

  SendingLoadingDataWidget({Key key,@required this.isLoading,@required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isLoading ? Container(
          width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withOpacity(0.3),
            child: Center(child: LoadingIndicatorWidget())) : SizedBox()
      ],
    );
  }
}
