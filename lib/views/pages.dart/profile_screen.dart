
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  void initState() {
    super.initState();
    getEmail();
  }

  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 36, 161),
      ),
      body: Text(userEmail),
    );
  }

  getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('email') ?? '--';
    setState(() {});
  }
}
