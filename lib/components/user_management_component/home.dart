import 'package:flutter/material.dart';
import 'package:quotes_app/screens/feedback_management/add_feedback.dart';
import 'package:quotes_app/screens/quote_management/quote_home.dart';
import '../../screens/favorite_management/find_quotes.dart';

class Home extends StatelessWidget {
  static String routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home'),
        ),
        actions: [IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (_) => const AddFeedback(userId: 'US001',)
          ));
        }, icon: const Icon(Icons.feedback_sharp))],
      ),
      body: Card(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 250,
            ),
            //Child 01
            //Child 02
            Card(
              //color: Colors.cyanAccent,
              child: Column(
                children: [
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context)
                                  .pushNamed(FindQuotes.routeName)
                            },
                        child: const Text('Find Quotes')),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 70,
            ),
            Card(
              child: Column(
                children: [
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context)
                                  .pushNamed(QuoteHome.routeName)
                            },
                        child: const Text('Quotes')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
