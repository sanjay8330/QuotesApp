import 'package:flutter/material.dart';
import '../../screens/favorite_management/find_quotes.dart';
import '../quote_management_component/add_quotes.dart';

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
                                  .pushNamed(AddQuotes.routeName)
                            },
                        child: const Text('Add Quotes')),
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
