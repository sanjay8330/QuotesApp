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
    return Row(
      mainAxisSize: MainAxisSize.min,
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
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(quotes.quote),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 65.0),
                  child: Text(quotes.personName),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
