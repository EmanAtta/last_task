import 'package:flutter/material.dart';
import 'pages.dart/main_screen.dart';
import 'pages.dart/profile_screen.dart';
import 'pages.dart/setting_screen.dart';

class secondpage extends StatefulWidget {
  
  final String email;
  const secondpage({super.key, required this.email});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  
  int selectedIndex = 0;

  List<Widget> page = [
    main_screen(),
    profile_screen(),
    seting_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        /*title: Text('second page'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 173, 68, 150),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),     
               onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),*/
      body: page[selectedIndex],
      /*Column(children:[ 
       Text(widget.email),

      ],
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        ],
        onTap: (pageIndex) {
          selectedIndex = pageIndex;
          setState(() {
            
          });
        },
      ),
    );
  }
}
