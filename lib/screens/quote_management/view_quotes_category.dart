import 'package:flutter/material.dart';
import 'package:quotes_app/screens/quote_management/view_quotes.dart';

class ViewQuotesCategory  extends StatefulWidget {
  static String routeName = '/ViewQuotesCategory';

  const ViewQuotesCategory ({Key? key}) : super(key: key);

  @override
  State<ViewQuotesCategory > createState() => _ViewQuotesCategoryState();
}

class _ViewQuotesCategoryState extends State<ViewQuotesCategory > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Quotes by Category")),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 9.0,
              children: List.generate(choices.length, (index) {
                return Center(
                  child: SelectCard(choice: choices[index]),
                );
              }),
            ),
          ),
        ));
  }
}

class Choice {
  const Choice({required this.title});

  final String title;
}

const List<Choice> choices = <Choice>[
  Choice(
    title: 'Motivate',
  ),
  Choice(
    title: 'Religious',
  ),
  Choice(
    title: 'Politics',
  ),
  Choice(
    title: 'Sports',
  ),
  Choice(
    title: 'Education',
  ),
  Choice(
    title: 'Personal',
  ),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline6;
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ViewQuotes.routeName);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlueAccent,
          padding: const EdgeInsets.symmetric(
              horizontal: 52, vertical: 70),
        ),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Text(choice.title, style: textStyle),
              ]),
        ));
  }
}
