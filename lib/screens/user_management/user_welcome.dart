import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/model/user_model.dart';

import '../../components/user_management_component/home.dart';

class UserWelcome extends StatefulWidget {
  const UserWelcome({Key? key}) : super(key: key);

  @override
  State<UserWelcome> createState() => _UserWelcomeState();
}

class _UserWelcomeState extends State<UserWelcome> {

  //User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInuser = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Image.asset('assets/images/user_management/welcome.jpg', fit: BoxFit.contain),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Name",
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              Text("Email",
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15,),
              ActionChip(label: Text("Logout"), onPressed: () {}),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pushNamed(Home.routeName);
              }, child: const Text('Home Nav Test'))
            ],
          ),
        ),
      ),
    );
  }
}
