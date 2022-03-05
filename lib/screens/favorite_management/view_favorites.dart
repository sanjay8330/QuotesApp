import 'package:flutter/material.dart';
import 'package:quotes_app/components/layout.dart';

import '../../data/quotes.dart';

class ViewFavorites extends StatelessWidget {
  static String routeName = '/viewFavorites';

  const ViewFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        context: 'View Favorites',
      widget: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text("Don't let your mind kill your heart and soul",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: quotesList.length,
                itemBuilder: (context, index) {
                  Quotes quote = quotesList.elementAt(index);//Need to add a favorites list here
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset(quote.personImage),
                    ),
                    title: Text(quote.quote, overflow: TextOverflow.ellipsis, softWrap: false,),
                    subtitle: Text(quote.personName),
                    trailing: IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined)),
                    onTap: () {},
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
