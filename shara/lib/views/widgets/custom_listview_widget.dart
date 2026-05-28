import 'package:flutter/material.dart';

class MyCustomListView extends StatelessWidget {

  final int itemCount;
  final ScrollController scrollController;
  final Widget? Function(BuildContext,int) itemBuilder;
  final Widget Function(BuildContext,int) separatorBuilder;
  final Future<void> Function() onRefresh;

  MyCustomListView({Key? key,required this.itemCount, required this.scrollController,required this.itemBuilder,required this.separatorBuilder,required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView.separated(
      controller: scrollController,
      itemCount: itemCount,
      itemBuilder: itemBuilder, separatorBuilder: separatorBuilder,
    ), onRefresh: onRefresh);
  }
}
