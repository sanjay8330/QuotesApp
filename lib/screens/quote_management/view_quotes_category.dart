import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/quote_handler/database_handler.dart';
import 'package:quotes_app/screens/quote_management/view_quotes.dart';

class ViewQuotesCategory extends StatefulWidget {
  static String routeName = '/ViewQuotesCategory';

  const ViewQuotesCategory({Key? key}) : super(key: key);

  @override
  State<ViewQuotesCategory> createState() => _ViewQuotesCategoryState();
}

class _ViewQuotesCategoryState extends State<ViewQuotesCategory> {

  List allQuotesList = [];//Get all the quotes with all details
  List categories = [];//Get the categories from the list of quotes
  Set<String> uniqueCategories = {};//Using a map to pick only the unique categories
  List uniqueCategoriesList = [];//Adding the unique categories to a new list

  @override
  void initState() {
    super.initState();
    fetchQuotesList();
  }

  /*
  *******************************************************************************************************************
  * @Developer: Kasuni Navodya (IT19144986)
  * @Created Date: 23/03/2022
  * @Purpose: This method retrieves all the quotes from the Firestore.
  *******************************************************************************************************************
  */
  fetchQuotesList() async {
    List result = await DatabaseHandler().getAllQuotes();

    if(result.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error in retrieving details!!')
          )
      );
    }else{
      setState(() {
        allQuotesList = result;
      });

      for (var element in allQuotesList) {
        categories.add(element['category'].toString());
      }

      uniqueCategories = Set.from(categories);
      uniqueCategoriesList = uniqueCategories.toList();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Quotes by Category'),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: uniqueCategoriesList.isNotEmpty ? ListView.builder(
          itemCount: uniqueCategoriesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 100,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 52, vertical: 10),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) => ViewQuotes(selectedCategory: uniqueCategoriesList[index].toString(),)
                    ));
                  },
                  child: Text(
                    uniqueCategoriesList[index],
                    style: const TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
            );
          }
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.hourglass_empty, size: 50.0,),
          SizedBox(width: double.infinity, height: 10.0,),
          Text('Categories unavailable!'),
        ],
      ),
    );
  }
}
