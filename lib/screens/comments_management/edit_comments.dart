import 'package:flutter/material.dart';
import 'package:quotes_app/components/layout.dart';
import '../../database_manager/comments_handler/database_handler_comments.dart';
import '../../screens/comments_management/view_comments.dart';

class UpdateComments extends StatefulWidget {
  static String routeName = '/updateComment';
  final String? quote;
  final String? quoteID;

  const UpdateComments({
    Key? key,
    this.quoteID,
    this.quote,
  }) : super(key: key);

  @override
  State<UpdateComments> createState() => _UpdateCommentsState();
}

class _UpdateCommentsState extends State<UpdateComments> {

  @override
  void initState() {
    super.initState();
    fetchCommentsDetails();
    fetchQuotesList();
  }

  List quoteDetailList = [];
  List commentDetailList = [];
  String quoteText = '';
  String personImage = '';
  String personName = '';
  String? UserId = '02';
  String docId = '';
  String? contentText;
  String? UserIDforUpdate = '';
  String? QuoteIDforUpdate = '';
  DateTime? time;


  //retrieve quote
  fetchQuotesList() async {
    List result = await DatabaseHandler().getQuoteDetails(
        widget.quote.toString());

    if (result == null) {
      print('Unable to retrieve!');
    } else {
      setState(() {
        quoteDetailList = result;
      });

      setState(() {
        docId = quoteDetailList[1].toString();
      });

      for (var element in quoteDetailList) {
        setState(() {
          personName = element['personName'].toString();
          personImage = element['personImage'].toString();
          quoteText = element['quote'].toString();
          //category = element['category'].toString();
        });
      }
    }
  }

  //retrieve comment
  fetchCommentsDetails() async {
    List result = await DatabaseHandler().getCommentDetails(widget.quoteID.toString());

    if(result == null){
      print('Unable to retrieve!');
    }else{
      setState(() {
        commentDetailList = result;
      });

      setState(() {
        docId = commentDetailList[1].toString();
      });
      print(docId);

    }
  }


  @override
  Widget build(BuildContext context) {

    final _formkey = GlobalKey<FormState>();

    //update comment
    updateComment () async {
      if(_formkey.currentState!.validate()){
        _formkey.currentState!.save();
        bool result = await DatabaseHandler().updateComment(docId, contentText);

        if(result){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Comment Updated Successfully'),)
          );
          Navigator.of(context).pushNamed(ViewComments.routeName);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something went wrong. Try again later!'),)
          );
        }
      }
    }

    return Layout(
      context: 'Add Comment',
      widget: Column(
        children: [
          Flexible(
            //flex: 7,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text("Don't let your mind kill your heart and soul",
                        style: TextStyle(fontStyle: FontStyle.italic)),
                  ),
                ),
                const SizedBox(width: double.infinity, height: 40,),
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: personImage.isNotEmpty ? Image.network(personImage, width: 200, height: 200,) : null,
                  ),
                ),
                const SizedBox(width: double.infinity, height: 40,),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('"'+ quoteText +'"',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Text('By: '+ personName,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: double.infinity, height: 40,),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Card(
                  child: Form(
                      key: _formkey,
                      child: Container(
                        width: 400,
                        height: 300,
                        child: Card(
                          elevation: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Enter Comment*'),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                                child: TextFormField(
                                  initialValue: widget.quoteID,
                                  validator: (value) {
                                    if(value==null || value.isEmpty){
                                      return 'Comment Field is required';
                                    }
                                    return null;
                                  },
                                  maxLines: 4,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String? value) {
                                    if (value != null) {
                                      contentText = value;
                                      print(contentText);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                height: 25,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: updateComment,
                                  child: const Text('Save'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 138, vertical: 15),
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            ),)
        ],
      ),
    );

  }
}