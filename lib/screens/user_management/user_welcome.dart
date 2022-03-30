import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/model/user_model.dart';
import '../favorite_management/find_quotes.dart';
import '../feedback_management/add_feedback.dart';
import '../quote_management/add_quotes.dart';
import 'dashboard.dart';
import 'login_screen.dart';

class UserWelcome extends StatefulWidget {
  const UserWelcome({Key? key}) : super(key: key);

  @override
  State<UserWelcome> createState() => _UserWelcomeState();
}

class _UserWelcomeState extends State<UserWelcome> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 180,
                child: Image.asset('assets/images/user_management/welcome.jpg',
                    fit: BoxFit.contain),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "${loggedInUser.firstname} ${loggedInUser.secondname}",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              Text(
                "${loggedInUser.email}",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              ActionChip(label: Text("Logout"), onPressed: () {}),
              ElevatedButton(
                  onPressed: () {
                    logout(context);
                  },
                  child: const Text('Home Nav Test'))
            ],
          ),
        ),
      ),
    );*/

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
                        builder: (_) => const AddFeedback(
                          userId: 'US001',
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
                height: 100,
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
                    {Navigator.of(context).pushNamed(FindQuotes.routeName)},
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
                height: 100,
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
              height: 20,
            ),
            Flexible(
              child: SizedBox(
                width: 270,
                height: 100,
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
                    onPressed: () => {
                      Navigator.of(context)
                          .pushNamed(AdminDashboard.routeName)
                    },
                    child: const Text('Admin Dashboard',
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 85,
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
