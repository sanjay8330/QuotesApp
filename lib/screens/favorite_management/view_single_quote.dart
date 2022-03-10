import 'package:flutter/material.dart';
import 'package:quotes_app/components/favorite_management_components/bottom_iconlist.dart';
import 'package:quotes_app/components/layout.dart';

import '../../database_manager/quote_handler/database_handler.dart';


class ViewSingleQuote extends StatefulWidget {
  static String routeName = '/viewSingleQuote';

  final String? quote;

  const ViewSingleQuote({
    Key? key,
    this.quote
  }) : super(key: key);

  @override
  State<ViewSingleQuote> createState() => _ViewSingleQuoteState();
}

class _ViewSingleQuoteState extends State<ViewSingleQuote> {

  List quoteDetailList = [];

  String personName = '';
  String personImage = '';
  String quote = '';
  //String category = '';

  @override
  void initState() {
    super.initState();
    print('QUOTE RECIEVED IS>>>'+widget.quote.toString());
    fetchQuotesList();
  }

  //Get the quote name from ViewQuotes UI
  //final argument = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic> {}) as Map;

  fetchQuotesList() async {
    List result = await DatabaseHandler().getQuoteDetails(widget.quote.toString());

    if(result == null){
      print('Unable to retrieve!');
    }else{
      setState(() {
        quoteDetailList = result;
      });

      for (var element in quoteDetailList) {
        setState(() {
          personName = element['personName'].toString();
          //personImage = element['personImage'].toString();
          quote = element['quote'].toString();
          //category = element['category'].toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Layout(
        context: "Quote",
      widget: Column(
        children: [
          Flexible(
            //flex: 7,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text("Don't let your mind kill your heart and soul",
                        style: TextStyle(fontStyle: FontStyle.italic)),
                  ),
                ),
                const SizedBox(width: double.infinity, height: 40,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset('assets/images/favorite_management/person1.jpg', width: 100, height: 100,),
                ),
                const SizedBox(width: double.infinity, height: 40,),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('" '+ quote +'"',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Text('By: '+ personName,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: double.infinity, height: 40,),
              ],
            ),
          ),
          const SizedBox(width: double.infinity, height: 10,),
          Align(
            alignment: Alignment.bottomCenter,
              child: BottomIconList(copyText: quote,))
        ],
      )
    );
  }
}
