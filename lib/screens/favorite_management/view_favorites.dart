import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/quote_handler/database_handler.dart' as QuoteDatabase;
import 'package:quotes_app/screens/favorite_management/view_single_quote.dart';

import '../../database_manager/favorite_manager/database_handler_favorites.dart';

class ViewFavorites extends StatefulWidget {
  static String routeName = '/viewFavorites';

  final String? userID;
  const ViewFavorites({
    Key? key,
    this.userID,
  }) : super(key: key);

  @override
  State<ViewFavorites> createState() => _ViewFavoritesState();
}

class _ViewFavoritesState extends State<ViewFavorites> {
  List userQuoteList = [];
  List quoteList = [];
  Icon cusIcon = const Icon(Icons.search);

  Widget cusSearchBar = const Center(child: Text("View Favorites"));

  @override
  void initState() {
    super.initState();
    fetchUserQuotes();
  }

  /*
   *********************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 11/03/2022
   * @Purpose: This method gets the list of quotes already added to favorites by the user from Firestore
   * *******************************************************************************************************************
   */
  fetchQuoteDetail(quote) async {
    List result = await QuoteDatabase.DatabaseHandler().getQuoteDetails(quote);

    if(result == null){
      print('Unable to retrieve!');
    }else{
      List quoteListSearch = result;

      for (var element in quoteListSearch) {
        setState(() {
          quoteList.add(element['quote'].toString());
        });
      }
    }
  }

  /*
   *********************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 28/03/2022
   * @Purpose: This method search the value entered in search field and check in firestore database
   * *******************************************************************************************************************
   */
  searchQuotes(String value) async {

    for(String quote in quoteList){
      if(quote.contains(value)){
        print('Quote Found!'+quote);
        quoteList = [];
        fetchQuoteDetail(quote);
      }
    }
  }

  /*
   *********************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 11/03/2022
   * @Purpose: This method gets the list of quotes already added to favorites by the user from Firestore
   * *******************************************************************************************************************
   */
  fetchUserQuotes() async {
    dynamic result = await DatabaseHandler().getQuotesByUserID(widget.userID.toString());

    //Set the results obtained to userQuotesList
    setState(() {
      userQuoteList = result;
    });

    //Set the values obtained from the quotes list to an independant list
    //Sample Response -> {quotes: [Early bird catches the worm , No matter what happens try to believe in god]}
    for (var element in userQuoteList) {
      setState(() {
        quoteList = element['quotes'];
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    /*
   *******************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 11/03/2022
   * @Purpose: This method delete quotes from the favorite list of the user from the Firestore.
   *******************************************************************************************************************
   */
    void deleteQuoteFromToFavorites(String quoteToDelete) async {

        //Adds the quote that user selects to delete
        List quoteListTodelete = [];
        quoteListTodelete.add(quoteToDelete);

        bool result = await DatabaseHandler().removeQuotesForUserID(widget.userID.toString(), quoteListTodelete);

        if(result){
          fetchUserQuotes();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Quote Removed from Favorites!')
              )
          );
        }else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Something went wrong. Try again later!')
              )
          );
        }
    }

    /*
   *******************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 28/03/2022
   * @Purpose: Clear the search and load the original quote list.
   *******************************************************************************************************************
   */
    clearSearch() async {
      fetchUserQuotes();
    }

    return Scaffold(
      appBar: AppBar(
        title: cusSearchBar,
        actions: [
          IconButton(
            icon: cusIcon,
            onPressed: (){
              setState(() {
                if(cusIcon.icon == Icons.search){
                  cusIcon = const Icon(Icons.cancel);
                  cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here",
                    ),
                    onChanged: (String value){
                      if(value.isNotEmpty){
                        searchQuotes(value.toString());
                      }else{
                        clearSearch();
                      }
                    },
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                }
                else{
                  cusIcon = const Icon(Icons.search);
                  cusSearchBar = const Text("View Favorites");
                }
              });
            },
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text("Don't let your mind kill your heart and soul",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          Flexible(
            child: quoteList.isNotEmpty ? ListView.builder(
                itemCount: quoteList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4,
                    child: ListTile(
                      title: Text('" ' + quoteList[index] + '"'),
                      trailing: IconButton(onPressed: () {
                        deleteQuoteFromToFavorites(quoteList[index]);
                      }, icon: const Icon(Icons.delete_forever)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (_) => ViewSingleQuote(quote: quoteList[index])
                        ));
                      },
                    ),
                  );
                }
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.hourglass_empty, size: 50.0,),
                SizedBox(width: double.infinity, height: 10.0,),
                Text('No Quotes In Favorites'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
