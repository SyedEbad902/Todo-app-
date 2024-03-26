import 'dart:js_interop_unsafe';
import 'dart:js_util';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List studentData = ["Ebad", "Osama", "Ali", 'AJmal'];

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leadingWidth: 90,
              leading: Container(
                // color: Colors.amber,
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/007/469/007/small/formal-suit-man-in-simple-flat-personal-profile-icon-or-symbol-people-concept-illustration-vector.jpg"),
                      ),
                    ),
                    Text("Hello Ebad!"),
                  ],
                ),
              ),
              toolbarHeight: 120,
            ),
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter some text",
                        hintStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Today`s Task",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: studentData.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          height: 100,
                          child: ListTile(
                            title: Text("${studentData[index]}"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, size: 22)),
                          ),
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
