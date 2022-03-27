import 'package:flutter/material.dart';
import 'package:quotes_app/components/user_management_component/home.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const Home()));
              },
              icon: const Icon(Icons.home)),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: widget,
    );
  }
}
