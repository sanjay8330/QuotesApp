import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final String context;
  final Widget? widget;

  const Layout({
    Key? key,
    required this.context,
    this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(this.context),),
      ),
      body: widget,
    );
  }
}
