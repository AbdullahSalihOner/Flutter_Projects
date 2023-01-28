import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo.shade500,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50,
              backgroundImage: AssetImage('images/2.jpg'),
            ),
            Text(
              "Cristiano Ronaldo",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'The Best',
              style: TextStyle(
                fontSize: 32,
                color: Colors.redAccent,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
              height: 10,
              width: 300,
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.redAccent.shade700,
                  size: 35,
                ),
                title: Text(
                  '+0507070707',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent.shade700,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.redAccent.shade700,
                  size: 35,
                ),
                title: Text(
                  'Süüüüü7@hotmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent.shade700,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
