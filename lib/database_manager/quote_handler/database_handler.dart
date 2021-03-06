import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler {
  final CollectionReference quoteslist = FirebaseFirestore.instance.collection('Quotes');

  List quotesListToReturn = [];
  List personQuotesListToReturn = [];
  List personDetailListToReturn = [];
  List quoteDetailListToReturn = [];
  List allQuoteListToReturn = [];

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
  * @Modified By - Sanjay Sakthivel - 26/03/22 - Code to capture the document ID and add to list
  * @Purpose - Get the quote details from the Firebase.
  **********************************************************************************************
   */
  Future getQuoteDetails(String quote) async {
    try{

      List quoteDetaillocal = [];
      String docID = '';

      await quoteslist.where('quote', isEqualTo: quote).get().then((querysnapshot) {
        for (var element in querysnapshot.docs) {
          docID = element.id.toString();
          quoteDetaillocal.add(element.data());
        }
        quoteDetaillocal.add(docID);
        quoteDetailListToReturn = quoteDetaillocal;
      });
      return quoteDetailListToReturn;
    }catch(error) {
      print('Error Occurred in Retrieve '+ error.toString());
      return null;
    }
  }

  /*
  **********************************************************************************************
  * @Developer - Kasuni Navodya (IT19144986)
  * @Created Date - 15/03/2022
  * @Purpose - Add the quote details to the Firebase.
  **********************************************************************************************
   */
  Future saveQuote (String? personName, String? quote, String? selectedCategory, String? imageURL) async {
    try{
      bool successStatus = false;

      await quoteslist.add({
        'personName': personName,
        'quote': quote,
        'category': selectedCategory,
        'personImage': imageURL
      }).then((value){
        successStatus = true;
      });
      return successStatus;
    }catch(error) {
      print('Error Occurred in Adding Quote '+ error.toString());
      return false;
    }
  }

  /*
  **********************************************************************************************
  * @Developer - Kasuni Navodya (IT19144986)
  * @Created Date - 15/03/2022
  * @Purpose - Get the quote details from the Firebase.
  **********************************************************************************************
   */
  Future getAllQuotes() async {
    try{
      List allQuoteDetailLocal = [];

      await quoteslist.get().then((querysnapshot) {
        for (var element in querysnapshot.docs) {
          allQuoteDetailLocal.add(element.data());
        }
        allQuoteListToReturn = allQuoteDetailLocal;
      });
      return allQuoteListToReturn;
    }catch(error) {
      print('Error Occurred in Retrieving Quotes '+ error.toString());
      return null;
    }
  }

  /*
  **********************************************************************************************
  * @Developer - Kasuni Navodya (IT19144986)
  * @Created Date - 20/03/2022
  * @Purpose - Update the quote details to the Firebase.
  **********************************************************************************************
   */
  Future updateQuote (String? docID, String? newPersonName, String? newQuote, String? newSelectedCategory, String? newImageURL) async {
    try{
      bool successStatus = false;

      await quoteslist.doc(docID).update({
        'personName': newPersonName,
        'quote': newQuote,
        'category': newSelectedCategory,
        'personImage': newImageURL
      }).then((value){
        successStatus = true;
      });
      return successStatus;
    }catch(error) {
      print('Error Occurred in Updating Quote '+ error.toString());
      return false;
    }
  }

/*
  **********************************************************************************************
  * @Developer - Kasuni Navodya (IT19144986)
  * @Created Date - 20/03/2022
  * @Purpose - Remove the quote details from the Firebase.
  **********************************************************************************************
 */
  Future removeQuote (String docId) async {
    try{
      bool successStatus = false;

      await quoteslist.doc(docId)
          .delete()
          .then((value) {
        successStatus = true;
      });
      return successStatus;
    }catch(error) {
      print('Error Occurred in Removing Quote'+ error.toString());
      return false;
    }
  }
}