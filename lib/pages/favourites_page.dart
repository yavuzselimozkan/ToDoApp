import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites Page"),
        centerTitle: true,
      ),
      body: Center(
          child:
          Icon(Icons.access_time,color: Colors.grey,size: 100)
      ),
    );
  }
}