import 'package:flutter/material.dart';
import 'package:quotes_app/components/layout.dart';
import '../../database_manager/comments_handler/database_handler_comments.dart';

class AddComments extends StatefulWidget {
  static String routeName = '/AddComments';

  const AddComments({Key? key}) : super(key: key);

  @override
  State<AddComments> createState() => _AddCommentsState();

}

class _AddCommentsState extends State<AddComments> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();

    String? content;

    addComments() async {
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();
        bool result = await DatabaseHandler().saveComment(content);

        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Comment Added'),)
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Something went wrong. Try again later!'),)
          );
        }
      }
    }

    return Layout(
        context: 'Add Comment',
        widget: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Form(
                    child: Container(
                      width: 400,
                      height: 715,
                      child: Card(
                        elevation: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Add your comment*'),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextFormField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (String? value) {
                            if (value != null) {
                              content = value;
                              print(content);
                            }
                          }
                          ),
                      ),
                          Center(
                          child: ElevatedButton(
                          onPressed: addComments,
                          child: const Text('Add Comment'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 138, vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),
              ]
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}
