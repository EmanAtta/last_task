// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Users_list.dart';
import 'sceand_page.dart';

class homepage2 extends StatelessWidget {
  const homepage2({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'first page',
          style: TextStyle(color: Color.fromARGB(255, 53, 188, 197)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 73, 73, 126),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: 450,
              height: 200,
              child: Image.asset("assets/p.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('email'),
                ),
                validator: (value) {
                  if (value!.contains("a")) {
                    return null;
                  } else {
                    return "not vaild";
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text('password'),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.length < 6) {
                    return "password should be more than 6";
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 75, 103, 129),
              ),
              width: 110,
              height: 40,
              child: MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool loginresponse = await SignByFirbase(
                        emailController.text, passwordController.text);
                    if (loginresponse == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => users_data(
                                // email: emailController.text,
                                )),
                      );
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Login faild")));
                    }
                  } else {
                    emailController.clear();
                  }
                },

                /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              secondpage(email: emailController.text)),
                    ); */

                child: Text(
                  'login',
                  style: TextStyle(color: Color.fromARGB(255, 125, 173, 196)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  Future<bool> SignByFirbase(String email, String password) async {
    bool response = false;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        print(user?.uid);
        saveEmail(user!.email!);
        response = true;
        return response;
      }
      return response;
    } catch (e) {
      return response;
    }
  }
}

/*SignByFirbase(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    print(user?.uid);
    saveEmail(user!.email!);
  } */



/*backgroundColor: const Color.fromARGB(255, 61, 142, 153),
      body: SafeArea(
        child: Container(
          child: Text('eman atta',
          style: TextStyle(
            fontSize: 20,
        
          ),),
          color: const Color.fromARGB(255, 240, 228, 228),
          margin: EdgeInsets.all(25),
          width: 90,
          height: 80,
          
          
        ),
      ),
       */

/*
backgroundColor: Color.fromARGB(255, 123, 144, 163),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 161, 166, 168),
        title:Text('home page',
        style: TextStyle(
          color: Color.fromARGB(255, 108, 85, 194)
        ),) ,
      ),
      body: Column(children: [
        Text('hellow',
        style: TextStyle(
          backgroundColor: Color.fromARGB(255, 109, 98, 199),
          color: Colors.black,
          fontSize: 25,
          
        ),),

        Container(
          width:300,
          height: 200,
          padding: EdgeInsets.only(top: 120,left: 70),
          child: Image.asset('assets/ff.png'),

        )

      ],),
*/ 