import 'package:flutter/material.dart';

class ViewQuotesCategory extends StatefulWidget {
  static String routeName = '/ViewQuotesCategory';

  const ViewQuotesCategory({Key? key}) : super(key: key);

  @override
  State<ViewQuotesCategory> createState() => _ViewQuotesCategoryState();
}

class _ViewQuotesCategoryState extends State<ViewQuotesCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Quotes by Category")),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
