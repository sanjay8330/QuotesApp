import 'package:flutter/material.dart';
import 'package:quotes_app/screens/quote_management/view_quotes_person.dart';

class PeopleQuotesList extends StatefulWidget {
  static String routeName = '/PeopleQuotesList';

  const PeopleQuotesList({Key? key}) : super(key: key);

  @override
  State<PeopleQuotesList> createState() => _PeopleQuotesListState();
}

class _PeopleQuotesListState extends State<PeopleQuotesList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Quotes by People")),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
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
  const Choice({required this.title, required this.image});

  final String title;
  final String image;
}

const List<Choice> choices = <Choice>[
  Choice(
    title: 'Mahatma Gandhi',
    image: "assets/images/quotes_management/sharuk.jpg",
  ),
  Choice(
    title: 'Albert Einstein',
    image: "assets/images/quotes_management/sharuk.jpg",
  ),
  Choice(
    title: 'Mickel Jackson',
    image: "assets/images/quotes_management/sharuk.jpg",
  ),
  Choice(
    title: 'Bruce Lee',
    image: "assets/images/quotes_management/sharuk.jpg",
  ),
  Choice(
    title: 'Shahrukh Khan',
    image: "assets/images/quotes_management/sharuk.jpg",
  ),
  Choice(
    title: 'Cristiano Ronaldo',
    image: "assets/images/quotes_management/sharuk.jpg",
  ),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge;
    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                IconButton(icon: Image.asset(choice.image), iconSize: 130, onPressed: () {
                  Navigator.of(context).pushNamed(ViewQuotesByPerson.routeName);
                },),
                Text(choice.title, style: textStyle),
              ]),
        ));
  }
}
