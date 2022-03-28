import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/comments_handler/database_handler_comments.dart';
import 'package:quotes_app/screens/comments_management/add_comments.dart';
import '../../components/layout.dart';

class ViewComments extends StatefulWidget {
  static String routeName = '/ViewComments';
  //final String? QuoteID = 'D3onguNGLjHhaQ509Xz3';
  final String? quoteID;

  const ViewComments({
    Key? key,
    this.quoteID
  }) : super(key: key);

  @override
  State<ViewComments> createState() => _ViewCommentsState();
}


class _ViewCommentsState extends State<ViewComments> {

  List comments = [];

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

  void deleteComment(String commentID) async {

    String commentId = commentID;

    bool result = await DatabaseHandler().deleteComments(commentId);

    if(result){
      getCommentsList();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Comment deleted!')
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

  @override
  Widget build(BuildContext context) {

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
                    child: Column(
                      children: [
                        ListTile(
                          /*leading: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: comments[index]['personImage'].toString().isNotEmpty ? Image.network(comments[index]['personImage']) : null,
                      ),*/
                          title: Text(comments[index]['Content'], overflow: TextOverflow.ellipsis, softWrap: false,),
                          subtitle: Text(comments[index]['UserId']),
                          trailing: IconButton(onPressed: () {deleteComment(comments[index] ['Content']);}, icon: const Icon(Icons.delete_forever)),
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
              onPressed: () {Navigator.of(context).pushNamed(AddComments.routeName);},
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

}