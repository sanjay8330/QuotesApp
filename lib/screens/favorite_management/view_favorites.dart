import 'package:flutter/material.dart';
import 'package:quotes_app/components/favorite_management_components/quotes_listview.dart';
import 'package:quotes_app/components/layout.dart';

class ViewFavorites extends StatelessWidget {
  static String routeName = '/viewFavorites';

  const ViewFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        context: "Favorites Quotes List",
        widget: Column(
          children: const [
            QuotesListView(
              personImage: 'assets/images/3.jpg',
              quote: 'Early bird catches worm',
              personName: 'Charles David',
            ),
            QuotesListView(
              personImage: 'assets/images/3.jpg',
              quote: 'Early bird catches worm',
              personName: 'Charles David',
            ),
          ],
        ),
    );
  }
}
