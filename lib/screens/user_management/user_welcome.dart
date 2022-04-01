import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/model/user_model.dart';
import '../favorite_management/find_quotes.dart';
import '../feedback_management/add_feedback.dart';
import '../quote_management/add_quotes.dart';
import 'login_screen.dart';

class UserWelcome extends StatefulWidget {
  static String routeName = '/UserWelcome';

  const UserWelcome({Key? key}) : super(key: key);

  @override
  State<UserWelcome> createState() => _UserWelcomeState();
}

class _UserWelcomeState extends State<UserWelcome> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String? userID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('user ID' + user.toString()!);
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {
        print('Logged in user ID : '+loggedInUser.uid.toString());//Added By Sanjay - Get the current user ID
        userID = loggedInUser.uid.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Quote App'),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddFeedback(
                          userId: userID,
                        )));
              },
              icon: const Icon(Icons.feedback_sharp)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              icon: const Icon(Icons.login)),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/user_management/1.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(83.0),
              child: Text(
                'QUORE',
                style: TextStyle(
                    fontSize: 69,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: SizedBox(
                width: 270,
                height: 140,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1.0,
                      primary: Colors.blue.withOpacity(0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                          side: BorderSide(color: Colors.white)),
                    ),
                    onPressed: () =>

                    {Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (_) => FindQuotes(UserId: loggedInUser.uid
                    )))},
                    child: const Text('Find Quotes',
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Flexible(
              child: SizedBox(
                width: 270,
                height: 140,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1.0,
                      primary: Colors.red.withOpacity(0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                          side: BorderSide(color: Colors.white)),
                    ),
                    onPressed: () =>
                    {Navigator.of(context).pushNamed(AddQuotes.routeName)},
                    child: const Text('Add Quotes',
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 140,
            ),
            const Center(
              child: Text(
                'Powered by 2022_REG_02 CTSE Group',
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
