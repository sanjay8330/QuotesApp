import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final String context;
  final Widget? widget;

  const Layout({
    Key? key,
    required this.context,
    this.widget, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Center(child: Text(this.context),),
        backgroundColor: Colors.blueGrey,
      ),
      body: widget,
    );
  }
}
