import 'package:flutter/material.dart';
import 'package:quotes_app/components/favorite_management_components/view_person_details.dart';
import 'package:quotes_app/components/layout.dart';
import 'package:quotes_app/screens/favorite_management/view_single_quote.dart';

import '../../database_manager/quote_handler/database_handler.dart';

class ViewQuotesByPerson extends StatefulWidget {
  static String routeName = '/viewQuotesByPerson';

  const ViewQuotesByPerson({Key? key}) : super(key: key);

  @override
  State<ViewQuotesByPerson> createState() => _ViewQuotesByPersonState();
}

class _ViewQuotesByPersonState extends State<ViewQuotesByPerson> {

  List quotesList = [];
  List personDetail = [];
  String personName = '';
  String personImage = '';
  String selectedPersonName = 'Nelson Mandela';
  
  @override
  void initState() {
    super.initState();
    fetchQuotesList();
    fetchPersonDetail();
  }

  fetchPersonDetail() async {
    List result = await DatabaseHandler().getPersonDetails(selectedPersonName);

    if(result.isEmpty){
      print('No data Found');
    }else{
      setState(() {
        personDetail = result;
      });

      for (var element in personDetail) {
        setState(() {
          personName = element['personName'].toString();
          //personImage = element['personImage'].toString();
        });
      }
    }
  }

  fetchQuotesList() async {
    List result = await DatabaseHandler().getQuotesByPersonName(selectedPersonName);

    if(result.isEmpty){
      print('Unable to retrieve!');
    }else{
      setState(() {
        quotesList = result;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Layout(
        context: 'View Quotes By Person',
      widget: Column(
        children: [
          ViewPersonDetails(
              personImage: 'assets/images/favorite_management/person1.jpg',
              personName: personName
          ),
          const SizedBox(width: double.infinity, height: 15,),
          Flexible(
            child: ListView.builder(
                itemCount: quotesList.length,
                itemBuilder: (context, index) {
                  //Quotes quote = quotesList.elementAt(index);
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4,
                    child: ListTile(
                      title: Text(quotesList[index]['quote'], overflow: TextOverflow.ellipsis, softWrap: false,),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Category : '+quotesList[index]['category']),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (_) => ViewSingleQuote(quote: quotesList[index]['quote'])
                        ));
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
