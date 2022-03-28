import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quotes_app/components/layout.dart';
import '../../database_manager/quote_handler/database_handler.dart';

class AddQuotes extends StatefulWidget {
  static String routeName = '/addQuotes';

  const AddQuotes({Key? key}) : super(key: key);

  @override
  State<AddQuotes> createState() => _AddQuotesState();
}

class _AddQuotesState extends State<AddQuotes> {
  var selectedCategory;
  String imageURL = '';

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();

    String? personName;
    String? quote;

    FirebaseStorage firebaseStorage =
        FirebaseStorage.instance;

    List<String> _categoryType = <String>[
      'Motivational',
      'Educational',
      'Religious',
      'Nature',
      'Sports',
      'Personal',
    ];

/*
   *********************************************************************************************************************
   * @Developer: Kasuni Navodya (IT19144986)
   * @Created Date: 20/03/2022
   * @Method: Upload Person Image related to quote
   * *******************************************************************************************************************
*/
    Future uploadImage() async {
      final picker = ImagePicker();
      XFile? pickedImage;

      try {
        pickedImage = await picker.pickImage(source: ImageSource.gallery);

        final String imageName = path.basename(pickedImage!.path);
        File imageFile = File(pickedImage.path);

        Reference reference = firebaseStorage.ref().child(imageName);
        await reference.putFile(imageFile);

        String downloadURL = await reference.getDownloadURL();
        print('IMAGE URL : ' + downloadURL);

        if(downloadURL != ''){
          setState(() {
            imageURL = downloadURL;
          });

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image uploaded Successfully'),)
          );
          print('Download Image URL : '+ imageURL.toString());
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image uploaded Failed!'),)
          );
        }
      } catch (error) {
        print('Error Occurred : ' + error.toString());
      }
    }

/*
   *********************************************************************************************************************
   * @Developer: Kasuni Navodya (IT19144986)
   * @Created Date: 15/03/2022
   * @Method: Add quote details to the firebase (Image, PersonName, Quote, Selected Category)
   * *******************************************************************************************************************
*/
    saveQuote () async {
      if(_formkey.currentState!.validate()){
        _formkey.currentState!.save();
        bool result = await DatabaseHandler().saveQuote(personName, quote, selectedCategory, imageURL);

        if(result){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Quote Added Successfully'),)
          );
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something went wrong. Try again later!'),)
          );
        }
      }
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
                          Center(
                              child: Image.asset(
                                'assets/images/quotes_management/quote.jpg',
                                width: 450,
                                height: 150,
                              )),
                          const SizedBox(
                            width: double.infinity,
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Category*'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  hint: Text(
                                    'Select Category',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: _categoryType
                                      .map((value) => DropdownMenuItem(
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    value: value,
                                  ))
                                      .toList(),
                                  onChanged: (selectedCategoryType) {
                                    setState(() {
                                      selectedCategory = selectedCategoryType;
                                    });
                                  },
                                  value: selectedCategory,
                                  elevation: 10,
                                  alignment: Alignment.center,
                                  style:const TextStyle(color:Colors.black, fontSize: 20),
                                  icon: const Icon(Icons.arrow_drop_down_circle),
                                  iconEnabledColor: Colors.blue,
                                  isExpanded: true,
                                  dropdownColor: Colors.white,
                                ),
                            ),
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: uploadImage,
                              child: const Text('+ Upload Image'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Person Name*'),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'Person Name Field is required';
                                }
                                return null;
                              },
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
                            child: Text('Enter Quote*'),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'Quote Field is required';
                                }
                                return null;
                              },
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
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: saveQuote,
                              child: const Text('Add Quote'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 138, vertical: 15),
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ),
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