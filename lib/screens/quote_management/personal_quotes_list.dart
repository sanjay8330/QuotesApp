import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/quote_handler/database_handler.dart';
import 'package:quotes_app/screens/quote_management/view_quotes_person.dart';

class PersonalQuotesList extends StatefulWidget {
  static String routeName = '/PersonalQuotesList';

  const PersonalQuotesList({Key? key}) : super(key: key);

  @override
  State<PersonalQuotesList> createState() => _PersonalQuotesListState();
}

class _PersonalQuotesListState extends State<PersonalQuotesList> {

  List quotesList = [];
  String selectedCategory = 'Personal';

  @override
  void initState() {
    super.initState();
    fetchQuotesList();
  }

  fetchQuotesList() async {
    List result = await DatabaseHandler().getQuotesByCategory(selectedCategory);

    if(result.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error in retrieving details!!')
          )
      );
    }else{
      setState(() {
        quotesList = result;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Personal People Quotes")),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(quotesList.length, (index) {
                return Center(
                  child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: double.infinity,
                                height: 10,
                              ),
                              IconButton(icon: Image.network(quotesList[index]['personImage']), iconSize: 130, onPressed: () {
                                //Navigator.of(context).pushNamed(ViewQuotesByPerson.routeName);
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (_) => ViewQuotesByPerson(selectedPersonName: quotesList[index]['personName'],)
                                ));
                              },),
                              Text(quotesList[index]['personName'], style: Theme.of(context).textTheme.bodyLarge),
                            ]),
                      )),
                );
              }),
            ),
          ),
        ));
  }
}

