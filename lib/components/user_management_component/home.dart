import 'package:flutter/material.dart';
import 'package:quotes_app/screens/feedback_management/add_feedback.dart';
import '../../screens/favorite_management/find_quotes.dart';
import '../../screens/quote_management/add_quotes.dart';
import '../../screens/quote_management/quotes_list_for_admin.dart';

class Home extends StatelessWidget {
  static String routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Quote App'),
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
              height: 150,
            ),
            //Child 01
            //Child 02
            Card(
              //color: Colors.cyanAccent,
              child: Column(
                children: [
                  SizedBox(
                    width: 270,
                    height: 100,
                    child: ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context)
                                  .pushNamed(FindQuotes.routeName)
                            },
                        child: const Text('Find Quotes')),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 50,
                  ),
                  SizedBox(
                    width: 270,
                    height: 100,
                    child: ElevatedButton(
                        onPressed: () => {
                          Navigator.of(context)
                              .pushNamed(AddQuotes.routeName)
                        },
                        child: const Text('Add Quotes')),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 50,
                  ),
                  SizedBox(
                    width: 270,
                    height: 100,
                    child: ElevatedButton(
                        onPressed: () => {
                          Navigator.of(context)
                              .pushNamed(AdminQuoteList.routeName)
                        },
                        child: const Text('Quote List - ADMIN')),
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
