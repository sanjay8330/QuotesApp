import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler {
  final CollectionReference quoteslist = FirebaseFirestore.instance.collection('Quotes');

  List quotesListToReturn = [];
  List personQuotesListToReturn = [];
  List personDetailListToReturn = [];

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
      print('Error Occured in Retrieve '+ error.toString());
      return null;
    }
  }

  Future getQuotesByPersonName(String personName) async {
    try{

      List quotesListlocal = [];

      await quoteslist.where('personName', isEqualTo: personName).get().then((querysnapshot) {
        querysnapshot.docs.forEach((element) {
          quotesListlocal.add(element.data());
        });
        personQuotesListToReturn = quotesListlocal;
      });
      return personQuotesListToReturn;
    }catch(error) {
      print('Error Occured in Retrieve '+ error.toString());
      return null;
    }
  }

  Future getPersonDetails(String personName) async {
    try{

      List personDetaillocal = [];

      await quoteslist.where('personName', isEqualTo: personName).get().then((querysnapshot) {
        querysnapshot.docs.forEach((element) {
          personDetaillocal.add(element.data());
        });
        personDetailListToReturn = personDetaillocal;
      });
      return personDetailListToReturn;
    }catch(error) {
      print('Error Occured in Retrieve '+ error.toString());
      return null;
    }
  }
}