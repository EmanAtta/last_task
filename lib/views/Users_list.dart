import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class users_data extends StatefulWidget {
  const users_data({super.key});

  @override
  State<users_data> createState() => _users_dataState();
}

class _users_dataState extends State<users_data> {
  CollectionReference user_da = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<QuerySnapshot<Object?>>(
          future: user_da.get(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return Text("Something's wrong");
            }

            if (snapshot.hasData == false && snapshot.data == null) {
              return Text("Document does not exist");
            }
            print(snapshot.connectionState.toString());
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    "Full Name: ${snapshot.data!.docs[index]['name']} ${snapshot.data!.docs[index]['age']} ${snapshot.data!.docs[index].data().toString().contains('id') ? snapshot.data?.docs[index]['desc'] : '--'}",
                  );
                },
              );
            }
            return Text("waiting");
          },
        ));
  }
}
