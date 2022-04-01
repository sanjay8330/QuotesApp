import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler{
  final CollectionReference quoteslist = FirebaseFirestore.instance.collection('UserFavoritesQuotes');

  List userQuotes = [];

  /*
  **********************************************************************************************
  * @Developer - Sanjay Sakthivel (IT19158228)
  * @Created Date - 10/03/2022
  * @Purpose - Get the quotes added to favorites by the user from Firestore.
  **********************************************************************************************
   */
  Future getQuotesByUserID(String userId) async {

    try{
      List userQuotesListlocal = [];

      await quoteslist.doc(userId).get().then((DocumentSnapshot documentSnapshot) {
        if(documentSnapshot.exists == false){
          quoteslist.doc(userId).set({'quotes': ''});//Added by Sanjay - if logged in user has no doc in favorites creates an empty one
        }else{
          userQuotesListlocal.add(documentSnapshot.data());
          userQuotes = userQuotesListlocal;
        }

      });
      print(userQuotes.toString());
      return userQuotes;
    }catch(error) {
      print('Error Occurred in Retrieve '+ error.toString());
      return null;
    }

  }

  /*
  **********************************************************************************************
  * @Developer - Sanjay Sakthivel (IT19158228)
  * @Created Date - 10/03/2022
  * @Purpose - Add the quotes to the favorite list for the user to Firestore.
  **********************************************************************************************
   */
  Future addQuotesForUserID(String userId, List quote) async {

    try{
      bool successStatus = false;

      await quoteslist.doc(userId)
          .update({'quotes': FieldValue.arrayUnion(quote)})
          .then((value){
        successStatus = true;
      });
      return successStatus;
    }catch(error) {
      print('Error Occurred in Adding Quote to Favorites '+ error.toString());
      return false;
    }

  }

  /*
  **********************************************************************************************
  * @Developer - Sanjay Sakthivel (IT19158228)
  * @Created Date - 10/03/2022
  * @Purpose - Remove the quote from the favorite list for the user in Firestore.
  **********************************************************************************************
   */
  Future removeQuotesForUserID(String userId, List quote) async {

    try{
      bool successStatus = false;

      await quoteslist.doc(userId)
          .update({'quotes': FieldValue.arrayRemove(quote)})
          .then((value){
        successStatus = true;
      });
      return successStatus;
    }catch(error) {
      print('Error Occurred in Removing Quote to Favorites '+ error.toString());
      return false;
    }

  }

}