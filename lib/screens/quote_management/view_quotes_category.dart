import 'package:flutter/material.dart';
import 'package:quotes_app/screens/quote_management/view_quotes.dart';

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
        title: const Center(
          child: Text('Quotes by Category'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            //Child 01
            const SizedBox(
              width: double.infinity,
              height: 70,
            ),
            //Child 02
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 290,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ViewQuotes.routeName);
                        },
                        child: const Text(
                          'Motivational',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 290,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ViewQuotes.routeName);
                        },
                        child: const Text(
                          'Religious',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 290,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ViewQuotes.routeName);
                        },
                        child: const Text(
                          'Political',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 290,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ViewQuotes.routeName);
                        },
                        child: const Text(
                          'Sports',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 290,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ViewQuotes.routeName);
                        },
                        child: const Text(
                          'Educational',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 290,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ViewQuotes.routeName);
                        },
                        child: const Text(
                          'Personal',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
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
