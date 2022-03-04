import 'package:flutter/material.dart';
import 'package:quotes_app/components/layout.dart';
import 'package:quotes_app/data/quotes.dart';
import 'package:quotes_app/screens/favorite_management/view_single_quote.dart';

class ViewFavorites extends StatelessWidget {
  static String routeName = '/viewFavorites';

  const ViewFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        context: "List of Quotes",
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
                    Quotes quote = quotesList.elementAt(index);
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset(quote.personImage),
                      ),
                      title: Text(quote.quote),
                      subtitle: Text(quote.personName),
                      onTap: () {
                        Navigator.of(context).pushNamed(ViewSingleQuote.routeName);
                      },
                    );
                  }
              ),
            ),
          ],
        )
    );
  }
}
