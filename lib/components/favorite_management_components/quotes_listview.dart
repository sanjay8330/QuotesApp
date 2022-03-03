import 'package:flutter/material.dart';

class QuotesListView extends StatelessWidget {
  final String personImage;
  final String quote;
  final String personName;

  const QuotesListView({
    Key? key,
    required this.personImage,
    required this.quote,
    required this.personName
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
              child: Image.asset(personImage, width: 50, height: 50),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(quote),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 65.0),
                  child: Text(personName),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
