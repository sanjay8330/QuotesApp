import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler {
  final CollectionReference commentslist = FirebaseFirestore.instance.collection('UserComments');

  List commentList = [];
  List commentListToReturn = [];
  List personDetailListToReturn = [];
  List quoteDetailListToReturn = [];
  List allQuoteListToReturn = [];

  //get comments by the quote ID
  Future getCommentsbyQuoteID(String quoteId) async {
    try {
      List commentsList = [];

      await commentslist.where('QuoteId', isEqualTo: quoteId).get().then((
          querysnapshot) {
        for (var element in querysnapshot.docs) {
          commentsList.add(element.data());
        }
        commentListToReturn = commentsList;
      });
      return commentListToReturn;
    } catch (error) {
      print('Error Occurred in Retrieve ' + error.toString());
      return null;
    }
  }

  //add comments
  Future saveComment (String? content) async {

    try{
      bool successStatus = false;

      await commentslist.add({
        'content': content
      }).then((value){
        successStatus = true;
      });
      return successStatus;

    }catch(error) {
      print('Error Occurred in Add Comments '+ error.toString());
      return false;
    }
  }

}