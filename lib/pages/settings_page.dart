import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
        centerTitle: true,
      ),
      body: Center(
        child:
          Icon(Icons.access_time,color: Colors.grey,size: 100)
      ),
    );
  }
}
