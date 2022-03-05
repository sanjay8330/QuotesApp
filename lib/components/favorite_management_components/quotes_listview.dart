import 'package:flutter/material.dart';
import 'package:quotes_app/data/quotes.dart';

class QuotesListView extends StatelessWidget {
  final Quotes quotes;

  const QuotesListView({
    Key? key,
    required this.quotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(quotes.personImage, width: 50, height: 50),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(quotes.quote, style: const TextStyle(
                    fontSize: 16
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(quotes.personName),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 250.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.preview)),
                  Text('Preview')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  Text('Remove')
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: double.infinity, height: 15,),
      ],
    );
  }
}
