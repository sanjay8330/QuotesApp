import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/favorite_manager/database_handler_favorites.dart';
import 'package:quotes_app/screens/favorite_management/view_favorites.dart';
import 'package:quotes_app/screens/comments_management/view_comments.dart';

class BottomIconList extends StatefulWidget {
  final String copyText;
  final String userID;

  const BottomIconList({
    Key? key,
    required this.copyText,
    required this.userID,
  }) : super(key: key);

  @override
  State<BottomIconList> createState() => _BottomIconListState();
}

class _BottomIconListState extends State<BottomIconList> {

  List userQuoteList = [];
  List quoteList = [];
  bool quoteAlreadyExist = false;

  @override
  void initState() {
    super.initState();
    fetchUserQuotes();
  }

  /*
   ********************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 11/03/2022
   * @Purpose: This method gets the list of quotes already added to favorites by the user
   ********************************************************************************************************************
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
   ******************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 11/03/2022
   * @Purpose: This method copies the quote to the clipboard
   ******************************************************************************************************************
   */
    void copyText() {
      FlutterClipboard.copy(widget.copyText).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Quote Copied To Clipboard')
            )
        );
      });
    }

    /*
   *******************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 11/03/2022
   * @Purpose: This method adds the quote to the favorite list of user
   *******************************************************************************************************************
   */
    void addToFavorites() async {

      //This checks if the quote selected to add to favorites already exists in the user favorite list
      for(String singleQuote in quoteList){
        if(singleQuote == widget.copyText){
          setState(() {
            quoteAlreadyExist = true;
            return;
          });
        }
      }

      if(quoteAlreadyExist){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Quote exists in Favorites!')
            )
        );
      }else{
        //Adds the quote if it doesn't exist in the favorite list of user
        List quoteListToUpdate = [];
        quoteListToUpdate.add(widget.copyText);

        bool result = await DatabaseHandler().addQuotesForUserID(widget.userID, quoteListToUpdate);

        if(result){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Quote Added to Favorites!')
              )
          );

          Navigator.push(context, MaterialPageRoute(
              builder: (_) => ViewFavorites(userID: widget.userID)
          ));
        }
      }

    }

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: addToFavorites,
                  icon: const Icon(
                    Icons.favorite_sharp,
                    color: Colors.red,
                  )
              ),
              const Text('Add to Favorites')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {Navigator.of(context).pushNamed(ViewComments.routeName);},
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.blue,
                  )
              ),
              const Text('Comments')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: copyText,
                  icon: const Icon(
                    Icons.copy_outlined,
                    color: Colors.black,
                  )
              ),
              const Text('Copy to Clipboard')
            ],
          ),
        ],
      ),
    );
  }
}
