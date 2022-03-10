import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/quote_handler/database_handler.dart';
import '../../components/layout.dart';
import '../favorite_management/view_single_quote.dart';

class ViewQuotes extends StatefulWidget {
  static String routeName = '/viewQuotes';

  const ViewQuotes({Key? key}) : super(key: key);

  @override
  State<ViewQuotes> createState() => _ViewQuotesState();
}

class _ViewQuotesState extends State<ViewQuotes> {

  List quotesList = [];
  String selectedCategory = 'Motivational';

  @override
  void initState() {
    super.initState();
    fetchQuotesList();
  }

  fetchQuotesList() async {
    List result = await DatabaseHandler().getQuotesByCategory(selectedCategory);

    if(result == null){
      print('Unable to retrieve!');
    }else{
      setState(() {
        quotesList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //String selectedCategory = 'Motivational';

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
            Center(child: Text('Selected Category : '+selectedCategory)),
            const SizedBox(width: double.infinity, height: 10,),
            Flexible(
              child: ListView.builder(
                  itemCount: quotesList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      margin: const EdgeInsets.all(8.0),
                      elevation: 4,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.asset('assets/images/favorite_management/person1.jpg'),
                        ),
                        title: Text(quotesList[index]['quote'], overflow: TextOverflow.ellipsis, softWrap: false,),
                        subtitle: Text(quotesList[index]['personName']),
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
