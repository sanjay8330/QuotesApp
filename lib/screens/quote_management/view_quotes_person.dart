import 'package:flutter/material.dart';
import 'package:quotes_app/components/favorite_management_components/view_person_details.dart';
import 'package:quotes_app/components/layout.dart';
import 'package:quotes_app/data/quotes.dart';
import 'package:quotes_app/screens/favorite_management/view_single_quote.dart';

class ViewQuotesByPerson extends StatelessWidget {
  static String routeName = '/viewQuotesByPerson';

  const ViewQuotesByPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        context: 'View Quotes By Person',
      widget: Column(
        children: [
          const ViewPersonDetails(
              personImage: 'assets/images/favorite_management/person1.jpg',
              personName: 'Robert Downey'
          ),
          const SizedBox(width: double.infinity, height: 15,),
          Flexible(
            child: ListView.builder(
                itemCount: quotesList.length,
                itemBuilder: (context, index) {
                  Quotes quote = quotesList.elementAt(index);
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4,
                    child: ListTile(
                      title: Text(quote.quote, overflow: TextOverflow.ellipsis, softWrap: false,),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Category : '+quote.category),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(ViewSingleQuote.routeName);
                      },
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
