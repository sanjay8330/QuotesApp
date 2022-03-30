import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/comments_handler/database_handler_comments.dart';
import 'package:quotes_app/screens/comments_management/add_comments.dart';
import '../../components/layout.dart';
import '../../screens/comments_management/edit_comments.dart';

class ViewComments extends StatefulWidget {
  static String routeName = '/ViewComments';
  //final String? QuoteID = 'D3onguNGLjHhaQ509Xz3';
  final String? quoteID;
  final String? quote;
  final String? docID;
  final String? userID = '01';

  const ViewComments({
    Key? key,
    this.quoteID,
    this.docID,
    this.quote,
  }) : super(key: key);

  @override
  State<ViewComments> createState() => _ViewCommentsState();
}


class _ViewCommentsState extends State<ViewComments> {

  List comments = [];
  String? UserIDforDelete = '';

  @override
  void initState() {
    super.initState();
    getCommentsList();
  }

  getCommentsList() async {
    //List result = await DatabaseHandler().getCommentsbyQuoteID(widget.QuoteID.toString());
    List result = await DatabaseHandler().getCommentsbyQuoteID(widget.quoteID.toString());

    if(result.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No comments yet!!')
          )
      );
    }else{
      setState(() {
        comments = result;
      });
    }

  }




  @override
  Widget build(BuildContext context) {

    List commentDetailList = [];
    String docID = '';
    String userId = '';

    fetchCommentsDetails(commentToRetrieve) async {
    List result = await DatabaseHandler().getCommentDetails(commentToRetrieve);

    if(result == null){
    print('Unable to retrieve!');
    }else{
    setState(() {
    commentDetailList = result;
    });

    print('DOC ID : '+commentDetailList[0].toString());

    final iterableMap = commentDetailList.whereType<Map>().first;
    print(iterableMap['UserId']);
    setState(() {
    docID = commentDetailList[1].toString();
    UserIDforDelete = iterableMap['UserId'];
    });
    }
    }

    navigateToEdit(contentText) {
      if (UserIDforDelete == widget.userID) {
        {Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => UpdateComments(quoteID: contentText, quote: widget.quote.toString()
                )));
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('You can not edit this comment!')
            )
        );
      }
    }

    void deleteComment(String commentID) async {

      if (UserIDforDelete == widget.userID){
        await fetchCommentsDetails(commentID).then((value) async {
          bool result = await DatabaseHandler().deleteComments(docID);

          if(result){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Quote Removed from Database!')
                )
            );
            Navigator.of(context).pushNamed(AddComments.routeName);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Something went wrong. Try again later!')
                )
            );
          }
        });
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('You can not delete this comment!')
            )
        );
      }



    }

    return Layout(
      context: "Comments",
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text("Don't let your mind kill your heart and soul",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          const SizedBox(width: double.infinity, height: 10,),
          Flexible(
            child: comments.isNotEmpty ? ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(comments[index]['Content'], overflow: TextOverflow.ellipsis, softWrap: false,),
                        Column(
                          children: [
                            Text(comments[index]['Content'], overflow: TextOverflow.ellipsis, softWrap: false,),
                          ],
                        ),
                        Column(
                          children: [
                            Text(comments[index]['UserId']),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: () {deleteComment(comments[index]['Content'].toString());}, icon: const Icon(Icons.delete_forever)),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: () {navigateToEdit(comments[index]['Content'].toString());}, icon: const Icon(Icons.edit)),
                          ],
                        ),
                        ],
                    ),

                    );
                }
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.hourglass_empty, size: 50.0,),
                SizedBox(width: double.infinity, height: 10.0,),
                Text('No comments yet !'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => (AddComments(quoteID: widget.quoteID.toString(), quote: widget.quote.toString(),)
                )));
              },
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

}