import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quotes_app/components/layout.dart';

class AddFeedback extends StatefulWidget {
  static String routeName = '/addFeedback';

  const AddFeedback({Key? key}) : super(key: key);

  @override
  State<AddFeedback> createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Layout(
      context: 'Add Feedback',
      widget: SingleChildScrollView(
        child: Column(
          children: [
            //Child 01
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("Don't let your mind kill your heart and soul",
                    style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            const SizedBox(width: double.infinity, height: 10,),
            Image.asset('assets/images/favorite_management/feedback.PNG', width: 250, height: 250,),
            const SizedBox(width: double.infinity, height: 10,),
            Card(
              child: Form(
                key: _formkey,
                  child: Container(
                    width: 350,
                    height: 320,
                    child: Card(
                      elevation: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Rate your experience'),
                          ),
                          const SizedBox(width: double.infinity, height: 10,),
                          Center(
                            child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                }
                            ),
                          ),
                          const SizedBox(width: double.infinity, height: 10,),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Add Comments'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: TextFormField(
                              maxLines: 4,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: double.infinity, height: 10,),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Add Feedback')
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
