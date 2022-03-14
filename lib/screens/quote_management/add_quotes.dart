import 'package:flutter/material.dart';
import 'package:quotes_app/components/layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddQuotes extends StatefulWidget {
  static String routeName = '/addQuotes';

  const AddQuotes({Key? key}) : super(key: key);

  @override
  State<AddQuotes> createState() => _AddQuotesState();
}

class _AddQuotesState extends State<AddQuotes> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();

    String? personName;
    String? quote;
    String? categoryValue;

    List<String> items = [
      'Motivational',
      'Religious',
      'Politics',
      'Sports',
      'Personal',
    ];

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('AddQuotes');

    Future<void> saveQuote() async {
      _formkey.currentState!.save();

      collectionReference.add({
        'personName': personName,
        'quote': quote,
      }).then((value) {
        print('Quote Added!');
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Quote Added Successfully'),
        ));
      }).catchError((error) => print('Failed to add quote : $error'));
    }

    return Layout(
      context: 'Add Quote',
      widget: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Form(
                  key: _formkey,
                  child: Container(
                    width: 400,
                    height: 715,
                    child: Card(
                      elevation: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            height: 30,
                          ),
                          Center(
                              child: Image.asset(
                            'assets/images/quotes_management/uploadImage.png',
                            width: 150,
                            height: 150,
                          )),
                          const SizedBox(
                            width: double.infinity,
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Person Name*'),
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
                                  personName = value;
                                  print(personName);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Category*'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: Text(
                                  '  Select Category',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: categoryValue,
                                onChanged: (value) {
                                  setState(() {
                                    categoryValue = value as String;
                                  });
                                },
                                buttonHeight: 60,
                                buttonWidth: 440,
                                itemHeight: 60,
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Enter Quote*'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: TextFormField(
                              maxLines: 4,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onSaved: (String? value) {
                                if (value != null) {
                                  quote = value;
                                  print(quote);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 10,
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 10,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: saveQuote,
                                child: const Text('Add Quote')),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
