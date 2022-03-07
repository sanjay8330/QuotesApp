import 'package:flutter/material.dart';
import 'package:quotes_app/components/quote_management_component/add_quotes.dart';
import 'package:quotes_app/screens/favorite_management/find_quotes.dart';
import 'package:quotes_app/screens/favorite_management/view_favorites.dart';
import 'package:quotes_app/screens/favorite_management/view_single_quote.dart';
import 'package:quotes_app/screens/feedback_management/add_feedback.dart';
import 'package:quotes_app/screens/quote_management/view_quotes.dart';
import 'components/user_management_component/home.dart';

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
      initialRoute: Home.routeName,
      routes: {
        //Keshawa
        Home.routeName: (context) => const Home(),
        //Sanjay
        FindQuotes.routeName: (context) => const FindQuotes(),
        ViewSingleQuote.routeName: (context) => const ViewSingleQuote(),
        ViewFavorites.routeName: (context) => const ViewFavorites(),
        ViewQuotes.routeName: (context) => const ViewQuotes(),
        AddFeedback.routeName: (context) => const AddFeedback(),
        //Kasuni
        AddQuotes.routeName: (context) => const AddQuotes()
      },
    );
  }
}
