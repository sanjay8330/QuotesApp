import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/layout.dart';
import '../../data/quotes.dart';
import '../favorite_management/view_single_quote.dart';

class ViewQuotes extends StatelessWidget {
  static String routeName = '/viewQuotes';

  const ViewQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        context: "List of Quotes",
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
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
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      margin: const EdgeInsets.all(8.0),
                      elevation: 4,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.asset(quote.personImage),
                        ),
                        title: Text(quote.quote, overflow: TextOverflow.ellipsis, softWrap: false,),
                        subtitle: Text(quote.personName),
                        onTap: () {
                          Navigator.of(context).pushNamed(ViewSingleQuote.routeName);
                        },
                      ),
                    );
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                  onPressed: () {},
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
    );
  }
}
