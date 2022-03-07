import 'package:flutter/material.dart';

class AddQuotes extends StatelessWidget {
  static String routeName = '/addQuotes';

  const AddQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Quotes'),
        ),
      ),
    );
  }
}
