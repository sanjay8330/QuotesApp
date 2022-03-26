import 'package:flutter/material.dart';
import 'package:quotes_app/screens/quote_management/famous_quotes_list.dart';
import 'package:quotes_app/screens/quote_management/personal_quotes_list.dart';

class ViewQuotesPeople extends StatelessWidget {
  static String routeName = '/ViewQuotesPeople';

  const ViewQuotesPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Quotes by People'),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: [
            //Child 01
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("Don't let your mind kill your heart and soul",
                    style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            const SizedBox(width: double.infinity, height: 50,),
            //Child 02
            Center(
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/quotes_management/famous.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 190,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(FamousQuotesList.routeName);
                          },
                          child: const Text('Famous Quotes')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: double.infinity, height: 40,),
            Center(
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/quotes_management/personal.jpg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 190,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(PersonalQuotesList.routeName);
                          },
                          child: const Text('Personal Quotes')),
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
