import 'package:flutter/material.dart';
import 'package:quotes_app/components/favorite_management_components/bottom_iconlist.dart';
import 'package:quotes_app/components/layout.dart';


class ViewSingleQuote extends StatelessWidget {
  static String routeName = '/viewSingleQuote';

  const ViewSingleQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        context: "Quote",
      widget: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text("Don't let your mind kill your heart and soul",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          const SizedBox(width: double.infinity, height: 40,),
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset('assets/images/favorite_management/person1.jpg', width: 100, height: 100,),
          ),
          const SizedBox(width: double.infinity, height: 40,),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('"Mobile is the perfect example of what is enabling economic growth in technology sector"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Text('By: Chris Evans',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(width: double.infinity, height: 40,),
          const BottomIconList(copyText: 'Hello',)
        ],
      )
    );
  }
}
