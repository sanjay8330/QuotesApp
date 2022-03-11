import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler{
  final CollectionReference quoteslist = FirebaseFirestore.instance.collection('UserFavoritesQuotes');

  List userQuotes = [];

  Future getQuotesByUserID(String userId) async {
    try{

      List userQuotesListlocal = [];

      await quoteslist.doc(userId).get().then((DocumentSnapshot documentSnapshot) {
        userQuotesListlocal.add(documentSnapshot.data());
        userQuotes = userQuotesListlocal;
      });
      return userQuotes;
    }catch(error) {
      print('Error Occured in Retrieve '+ error.toString());
      return null;
    }
  }

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
      print('Error Occured in Retrieve '+ error.toString());
      return false;
    }

  }

}