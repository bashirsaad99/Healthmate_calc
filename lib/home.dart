import 'dart:ui';

import 'package:flutter/material.dart';
import 'bmiPage.dart';
import 'idealPage.dart';
import 'tenPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(child: Column(

        children: [
          const SizedBox(height: 85.0,),
          /// ten page
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => tenPage()),
              );
            },
            child: Container(
              width: 120,
              height: 120,
              padding: EdgeInsets.fromLTRB(22, 38, 22, 38),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Icon(Icons.woman_2_rounded, size: 100, color: Colors.white),
              child: const Text(
                'TEN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ),
          const SizedBox(height: 10.0,),
          const Text("Total Energy Needs", style: TextStyle(fontSize: 25.0,color: Colors.redAccent)),

          const SizedBox(height: 85.0,),




          /// bmi page button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => bmiPage()),
              );
            },
            child: Container(
              width: 120,
              height: 120,
              padding: EdgeInsets.fromLTRB(21, 38, 21, 38),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Icon(Icons.woman_2_rounded, size: 100, color: Colors.white),
              child: const Text(
                'BSC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ),
          const SizedBox(height: 10.0,),
          const Text("Body Stats Calculator", style: TextStyle(fontSize: 25.0,color: Colors.green)),

          const SizedBox(height: 85.0,),


        /// Ideal page button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => idealPage()),
              );
            },
            child: Container(
              width: 120,
              height: 120,
              padding: EdgeInsets.fromLTRB(23.5, 38, 23.5, 38),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Icon(Icons.woman_2_rounded, size: 100, color: Colors.white),
              child: const Text(
                'IBW',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ),
          const SizedBox(height: 10.0,),
          const Text("Ideal Body Weight", style: TextStyle(fontSize: 25.0,color: Colors.black26)),


        ],

      ),)
    );
  }
}
// text field
