import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/quote_handler/database_handler.dart';
import 'package:quotes_app/screens/quote_management/view_quotes_person.dart';

class PeopleQuotesList extends StatefulWidget {
  static String routeName = '/PeopleQuotesList';

  const PeopleQuotesList({Key? key}) : super(key: key);

  @override
  State<PeopleQuotesList> createState() => _PeopleQuotesListState();
}

class _PeopleQuotesListState extends State<PeopleQuotesList> {

  List allQuotesList = [];

  @override
  void initState() {
    super.initState();
    fetchQuotesList();
  }

  /*
   *******************************************************************************************************************
   * @Developer: Sanjay Sakthivel (IT19158228)
   * @Created Date: 22/03/2022
   * @Purpose: This method retrieves all the quotes from the Firestore.
   *******************************************************************************************************************
   */
  fetchQuotesList() async {
    List result = await DatabaseHandler().getAllQuotes();

    if(result.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error in retrieving details!!')
          )
      );
    }else{
      setState(() {
        allQuotesList = result;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
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
              // children: List.generate(choices.length, (index) {
              //   return Center(
              //     child: SelectCard(choice: choices[index]),
              //   );
              // }),
              children: List.generate(allQuotesList.length, (index) {
                return Center(
                  child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: double.infinity,
                                height: 10,
                              ),
                              IconButton(icon: Image.network(allQuotesList[index]['personImage']), iconSize: 130, onPressed: () {
                                //Navigator.of(context).pushNamed(ViewQuotesByPerson.routeName);
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (_) => ViewQuotesByPerson(selectedPersonName: allQuotesList[index]['personName'],)
                                ));
                              },),
                              Text(allQuotesList[index]['personName'], style: Theme.of(context).textTheme.bodyLarge),
                            ]),
                      )),
                );
              }),
            ),
          ),
        ));
  }
}

// class Choice {
//   const Choice({required this.title, required this.image});
//
//   final String title;
//   final String image;
// }
//
// const List<Choice> choices = <Choice>[
//   Choice(
//     title: 'Mahatma Gandhi',
//     image: "assets/images/quotes_management/sharuk.jpg",
//   ),
//   Choice(
//     title: 'Albert Einstein',
//     image: "assets/images/quotes_management/sharuk.jpg",
//   ),
//   Choice(
//     title: 'Mickel Jackson',
//     image: "assets/images/quotes_management/sharuk.jpg",
//   ),
//   Choice(
//     title: 'Bruce Lee',
//     image: "assets/images/quotes_management/sharuk.jpg",
//   ),
//   Choice(
//     title: 'Shahrukh Khan',
//     image: "assets/images/quotes_management/sharuk.jpg",
//   ),
//   Choice(
//     title: 'Cristiano Ronaldo',
//     image: "assets/images/quotes_management/sharuk.jpg",
//   ),
// ];
//
// class SelectCard extends StatelessWidget {
//   const SelectCard({Key? key, required this.choice}) : super(key: key);
//   final Choice choice;
//
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge;
//     return Card(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 const SizedBox(
//                   width: double.infinity,
//                   height: 10,
//                 ),
//                 IconButton(icon: Image.asset(choice.image), iconSize: 130, onPressed: () {
//                   Navigator.of(context).pushNamed(ViewQuotesByPerson.routeName);
//                 },),
//                 Text(choice.title, style: textStyle),
//               ]),
//         ));
//   }
// }
