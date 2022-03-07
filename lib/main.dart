import 'package:flutter/material.dart';
import 'package:quotes_app/screens/favorite_management/find_quotes.dart';
import 'package:quotes_app/screens/favorite_management/view_favorites.dart';
import 'package:quotes_app/screens/favorite_management/view_single_quote.dart';
import 'package:quotes_app/screens/feedback_management/add_feedback.dart';
import 'package:quotes_app/screens/quote_management/view_quotes.dart';

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
        FindQuotes.routeName : (context) => const FindQuotes(),
        ViewSingleQuote.routeName : (context) => const ViewSingleQuote(),
        ViewFavorites.routeName : (context) => const ViewFavorites(),
        ViewQuotes.routeName : (context) => const ViewQuotes(),
        AddFeedback.routeName : (context) => const AddFeedback(),
      },

    );
  }
}