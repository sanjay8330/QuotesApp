import 'package:flutter/material.dart';
import '../../screens/quote_management/quotes_list_for_admin.dart';

class AdminDashboard extends StatelessWidget {
  static String routeName = '/dashboard';

  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Admin Dashboard'),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/user_management/home3.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(83.0),
              child: Text(
                'QUORE',
                style: TextStyle(fontSize: 69, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 270,
              height: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    primary: Colors.blue.withOpacity(0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                        side: BorderSide(color: Colors.white)),
                  ),
                  onPressed: () => {},
                  child: const Text('Manage User Profiles',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            SizedBox(
              width: 270,
              height: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    primary: Colors.red.withOpacity(0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                        side: BorderSide(color: Colors.white)),
                  ),
                  onPressed: () =>
                  {Navigator.of(context).pushNamed(AdminQuoteList.routeName)},
                  child: const Text('Manage Quotes',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              height: 193,
            ),
            const Center(
              child: Text(
                'Powered by 2022_REG_02 CTSE Group',
                style: TextStyle(fontSize: 15, color: Colors.white54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
