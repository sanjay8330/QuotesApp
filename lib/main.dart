import 'package:flutter/material.dart';
import 'package:quotes_app/screens/quote_management/add_quotes.dart';
import 'package:quotes_app/screens/favorite_management/find_quotes.dart';
import 'package:quotes_app/screens/favorite_management/view_favorites.dart';
import 'package:quotes_app/screens/favorite_management/view_single_quote.dart';
import 'package:quotes_app/screens/feedback_management/add_feedback.dart';
import 'package:quotes_app/screens/quote_management/people_quotes_list.dart';
import 'package:quotes_app/screens/quote_management/quotes_list_for_admin.dart';
import 'package:quotes_app/screens/quote_management/view_quotes.dart';
import 'package:quotes_app/screens/quote_management/view_quotes_category.dart';
import 'package:quotes_app/screens/quote_management/view_quotes_people.dart';
import 'package:quotes_app/screens/quote_management/view_quotes_person.dart';
import 'package:quotes_app/screens/user_management/user_home.dart';

import 'components/user_management_component/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        User_home.routeName: (context) => const User_home(),
        //Sanjay
        FindQuotes.routeName: (context) => const FindQuotes(),
        ViewSingleQuote.routeName: (context) => const ViewSingleQuote(),
        ViewFavorites.routeName: (context) => const ViewFavorites(),
        ViewQuotes.routeName: (context) => const ViewQuotes(),
        AddFeedback.routeName: (context) => const AddFeedback(),
        ViewQuotesByPerson.routeName : (context) => const ViewQuotesByPerson(),
        //Kasuni
        AddQuotes.routeName: (context) => const AddQuotes(),
        PeopleQuotesList.routeName: (context) => const PeopleQuotesList(),
        ViewQuotesCategory.routeName: (context) => const ViewQuotesCategory(),
        ViewQuotesPeople.routeName: (context) => const ViewQuotesPeople(),
        AdminQuoteList.routeName: (context) => const AdminQuoteList(),
      },
    );
  }
}
