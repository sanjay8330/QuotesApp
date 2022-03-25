import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/quote_handler/database_handler.dart';
import 'package:quotes_app/screens/quote_management/update_quotes.dart';
import '../../components/layout.dart';
import '../favorite_management/view_single_quote.dart';

class AdminQuoteList extends StatefulWidget {
  static String routeName = '/AdminQuoteList';

  const AdminQuoteList({Key? key}) : super(key: key);

  @override
  State<AdminQuoteList> createState() => _AdminQuoteListState();
}

class _AdminQuoteListState extends State<AdminQuoteList> {
  List quotesList = [];

  @override
  void initState() {
    super.initState();
    fetchQuotesList();
  }

  fetchQuotesList() async {
    List result = await DatabaseHandler().getAllQuotes();

    if (result.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error in retrieving details!!')));
    } else {
      setState(() {
        quotesList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      context: "Admin - Quotes List",
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.all(1.0),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: quotesList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: quotesList[index]['personImage'].toString().isNotEmpty ? Image.network(quotesList[index]['personImage']) : null,
                      ),
                      title: Text(
                        quotesList[index]['quote'],
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      subtitle: Text(quotesList[index]['personName']),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ViewSingleQuote(
                                    quote: quotesList[index]['quote'])));
                      },
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          List<String> newValues = value.toString().split(':');

                          if(newValues[0].toString().contains('Edit')){
                            //print(quotesList[index]['quote']);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UpdateQuotes(
                                      quote: newValues[1].toString(),
                                    )));

                          }
                          if(newValues[0].toString().contains('Remove')){
                            print(newValues[1].toString());
                            print('Move to Remove UI');
                          }
                        },
                        itemBuilder: (ctx) => [
                          PopupMenuItem(
                            child: const Text("Remove"),
                            value: 'Remove :'+ quotesList[index]['quote'].toString(),
                          ),
                          PopupMenuItem(
                            child: const Text("Edit"),
                            value: 'Edit :'+ quotesList[index]['quote'].toString(),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
