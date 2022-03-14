import 'package:flutter/material.dart';
import 'package:quotes_app/screens/quote_management/add_quotes.dart';
import 'package:quotes_app/screens/quote_management/view_quotes_category.dart';
import 'package:quotes_app/screens/quote_management/view_quotes_people.dart';

class QuoteHome extends StatelessWidget {
  static String routeName = '/quoteHome';

  const QuoteHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Quote'),
        ),
      ),
      body: Card(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 100,
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
                              .pushNamed(AddQuotes.routeName)
                        },
                        child: const Text('Add Quotes')),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => {
                          Navigator.of(context)
                              .pushNamed(ViewQuotesPeople.routeName)
                        },
                        child: const Text('Quotes by People')),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => {
                          Navigator.of(context)
                              .pushNamed(ViewQuotesCategory.routeName)
                        },
                        child: const Text('Quotes by Category')),
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
