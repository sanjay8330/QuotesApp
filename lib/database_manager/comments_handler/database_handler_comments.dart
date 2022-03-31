import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler {
  final CollectionReference commentlist = FirebaseFirestore.instance.collection(
      'UserComments');
  final CollectionReference quoteslist = FirebaseFirestore.instance.collection(
      'Quotes');

  List commentListToReturn = [];
  List quoteDetailListToReturn = [];
  List commentListToReturnToDelete = [];
  List userDetailListToReturn = [];
  List userListToReturn = [];

  /*
  *********************************************************************************************************************
  * @Developer: D. P. Kavindi Gimshani(IT19150826)
  * @Created Date: 28/03/2022
  * @Method: retrieve get comments by the quote ID
  * *******************************************************************************************************************
 */
  Future getCommentsbyQuoteID(String quoteId) async {
    try {
      List commentsList = [];

      await commentlist.where('QuoteId', isEqualTo: quoteId).get().then((
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

  /*
  *********************************************************************************************************************
  * @Developer: D. P. Kavindi Gimshani(IT19150826)
  * @Created Date: 28/03/2022
  * @Method: add comments
  * *******************************************************************************************************************
 */
  Future saveComment(String? QuoteId, String? UserId, String? content, DateTime? time) async {
    try {
      bool successStatus = false;

      await commentlist.add({
        'Content': content,
        'QuoteId': QuoteId,
        'UserId': UserId,
        'Time': time
      }).then((value) {
        successStatus = true;
      });
      return successStatus;
    } catch (error) {
      print('Error Occurred in Adding Comments ' + error.toString());
      return false;
    }
  }

  /*
  *********************************************************************************************************************
  * @Developer: D. P. Kavindi Gimshani(IT19150826)
  * @Created Date: 28/03/2022
  * @Method: display quote using quote
  * *******************************************************************************************************************
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
  *********************************************************************************************************************
  * @Developer: D. P. Kavindi Gimshani(IT19150826)
  * @Created Date: 29/03/2022
  * @Method: get comment to delete
  * *******************************************************************************************************************
 */
  Future getCommentDetails(String content) async {
    try{

      List commentDetaillocal = [];
      String docID = '';

      await commentlist.where('Content', isEqualTo: content).get().then((querysnapshot) {
        for (var element in querysnapshot.docs) {
          docID = element.id.toString();
          commentDetaillocal.add(element.data());
        }
        commentDetaillocal.add(docID);
        commentListToReturnToDelete = commentDetaillocal;
      });
      return commentListToReturnToDelete;
    }catch(error) {
      print('Error Occurred in Retrieve '+ error.toString());
      return null;
    }
  }

  /*
  *********************************************************************************************************************
  * @Developer: D. P. Kavindi Gimshani(IT19150826)
  * @Created Date: 29/03/2022
  * @Method: delete comments
  * *******************************************************************************************************************
 */
  Future deleteComments(String commentId) async {

    try{
      bool successStatus = false;

      await commentlist.doc(commentId)
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

  /*
  *********************************************************************************************************************
  * @Developer: D. P. Kavindi Gimshani(IT19150826)
  * @Created Date: 30/03/2022
  * @Method: update comments
  * *******************************************************************************************************************
 */
  Future updateComment (String? docID, String? content) async {
    try{
      bool successStatus = false;
      print('dssd' + docID!);

      await commentlist.doc(docID).update({
        'Content': content,
      }).then((value){
        successStatus = true;
      });
      return successStatus;
    }catch(error) {
      print('Error Occurred in Updating Quote '+ error.toString());
      return false;
    }
  }
}