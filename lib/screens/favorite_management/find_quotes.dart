import 'package:flutter/material.dart';
import 'package:quotes_app/components/layout.dart';
import 'package:quotes_app/screens/favorite_management/view_favorites.dart';

class FindQuotes extends StatelessWidget {
  static String routeName = '/findQuotes';

  const FindQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        context: "Find Quotes",
        widget: Card(
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
              //Child 02
              Card(
                //color: Colors.cyanAccent,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Image.asset(
                        'assets/images/favorite_management/people.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        width: 250,
                        child: ElevatedButton(
                            onPressed: () => {
                              Navigator.of(context).pushNamed(ViewFavorites.routeName)
                            },
                            child: const Text('Find Quotes by People')),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: double.infinity, height: 40,),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Image.asset(
                        'assets/images/favorite_management/category.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        width: 250,
                        child: ElevatedButton(
                            onPressed: () => {},
                            child: const Text('Find Quotes by Category')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
