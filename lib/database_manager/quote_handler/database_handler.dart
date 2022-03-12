import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler {
  final CollectionReference quoteslist = FirebaseFirestore.instance.collection('Quotes');

  List quotesListToReturn = [];
  List personQuotesListToReturn = [];
  List personDetailListToReturn = [];
  List quoteDetailListToReturn = [];

  /*
  **********************************************************************************************
  * @Developer - Sanjay Sakthivel (IT19158228)
  * @Created Date - 09/03/2022
  * @Purpose - Get all quotes by category from the Firebase.
  **********************************************************************************************
   */
  Future getQuotesByCategory(String selectedCategory) async {
    try{

      List quotesListlocal = [];
      
      await quoteslist.where('category', isEqualTo: selectedCategory).get().then((querysnapshot) {
        querysnapshot.docs.forEach((element) {
          quotesListlocal.add(element.data());
        });
        quotesListToReturn = quotesListlocal;
      });
      return quotesListToReturn;
    }catch(error) {
      print('Error Occurred in Retrieve '+ error.toString());
      return null;
    }
  }

  /*
  **********************************************************************************************
  * @Developer - Sanjay Sakthivel (IT19158228)
  * @Created Date - 09/03/2022
  * @Purpose - Get all quotes by person name from the Firebase.
  **********************************************************************************************
   */
  Future getQuotesByPersonName(String personName) async {
    try{

      List quotesListlocal = [];

      await quoteslist.where('personName', isEqualTo: personName).get().then((querysnapshot) {
        for (var element in querysnapshot.docs) {
          quotesListlocal.add(element.data());
        }
        personQuotesListToReturn = quotesListlocal;
      });
      return personQuotesListToReturn;
    }catch(error) {
      print('Error Occurred in Retrieve '+ error.toString());
      return null;
    }
  }

  /*
  **********************************************************************************************
  * @Developer - Sanjay Sakthivel (IT19158228)
  * @Created Date - 09/03/2022
  * @Purpose - Get the person details from the Firebase.
  **********************************************************************************************
   */
  Future getPersonDetails(String personName) async {
    try{

      List personDetaillocal = [];

      await quoteslist.where('personName', isEqualTo: personName).get().then((querysnapshot) {
        for (var element in querysnapshot.docs) {
          personDetaillocal.add(element.data());
        }
        personDetailListToReturn = personDetaillocal;
      });
      return personDetailListToReturn;
    }catch(error) {
      print('Error Occurred in Retrieve '+ error.toString());
      return null;
    }
  }

  /*
  **********************************************************************************************
  * @Developer - Sanjay Sakthivel (IT19158228)
  * @Created Date - 09/03/2022
  * @Purpose - Get the quote details from the Firebase.
  **********************************************************************************************
   */
  Future getQuoteDetails(String quote) async {
    try{

      List quoteDetaillocal = [];

      await quoteslist.where('quote', isEqualTo: quote).get().then((querysnapshot) {
        for (var element in querysnapshot.docs) {
          quoteDetaillocal.add(element.data());
        }
        quoteDetailListToReturn = quoteDetaillocal;
      });
      return quoteDetailListToReturn;
    }catch(error) {
      print('Error Occurred in Retrieve '+ error.toString());
      return null;
    }
  }
}