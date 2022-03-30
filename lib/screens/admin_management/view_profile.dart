import 'package:flutter/material.dart';
import 'package:quotes_app/database_manager/user_handler/database_handler_user.dart';

class ViewProfile extends StatefulWidget {
  static String routeName = '/viewProfile';
  final String? userId;

  const ViewProfile({
    Key? key,
    this.userId
  }) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {

  //our form key
  final _formKey = GlobalKey<FormState>();

  //Local varibales to hold the data retrieved
  List userDetailList = [];
  String firstName = '';
  String lastName = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    loadUserDetail();
  }

  loadUserDetail() async {
    List result = await DatabaseHandlerUser().getUserDetails(widget.userId.toString());

    if(result == null){
      print('Unable to retrieve!');
    }else{
      setState(() {
        userDetailList = result;
      });

      for (var element in userDetailList) {
        setState(() {
          firstName = element['firstname'].toString();
          lastName = element['secondname'].toString();
          email = element['email'].toString();
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = firstName.isNotEmpty ? TextFormField(
      initialValue: firstName,
      autofocus: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ) : const Text('No Data');

    //second name field
    final secondNameField = lastName.isNotEmpty ? TextFormField(
      initialValue: lastName,
      autofocus: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ) : const Text('No Data');

    //email field
    final emailField = email.isNotEmpty ? TextFormField(
      initialValue: email,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ) : const Text('No Data');

    //update button
    final updateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () { },
        child: const Text(
          'Update',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.blueAccent),
            onPressed: () {
              //passing this to our root
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 180,
                        child: Image.asset(
                            'assets/images/user_management/homeIcon2.jpg'),
                      ),
                      const SizedBox(height: 18),
                      firstNameField,
                      const SizedBox(height: 18),
                      secondNameField,
                      const SizedBox(height: 18),
                      emailField,
                      const SizedBox(height: 25),
                      updateButton,
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
