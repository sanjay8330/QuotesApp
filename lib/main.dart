import 'package:flutter/material.dart';
import 'package:quotes_app/screens/favorite_management/find_quotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FindQuotes.routeName,
      routes: {
        FindQuotes.routeName : (context) => FindQuotes(),
      },

    );
  }
}