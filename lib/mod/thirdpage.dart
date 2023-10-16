import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String Name;
  final String phoneNumber;
  final String email;
  final String country;
  final String lifeHistory;

  SecondPage({
    required this.Name,
    required this.phoneNumber,
    required this.email,
    required this.country,
    required this.lifeHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name: $Name'),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Phone Number: $phoneNumber'),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Email: $email'),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Country: $country'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Life History: $lifeHistory'),
            ),
          ],
        ),
      ),
    );
  }
}
