import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List studentData = [
      "Ebad",
      "Osama",
      "Ali",
      'AJmal',
      "Amar",
      "Akbar",
      "Anthony"
    ];

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: 90,
            leading: Container(
              // color: Colors.amber,
              margin: const EdgeInsets.only(left: 10, top: 20),
              child: const Column(
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
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter some text",
                      hintStyle: const TextStyle(fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10, top: 10),
                      child: const Text(
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
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
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
                            onPressed: () {
                              setState(() {
                                studentData.removeAt(index);
                                print(studentData);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                          // trailing: FittedBox(
                          //   fit: BoxFit.fill,
                          //   child: Column(
                          //     children: [
                          //       Container(
                          //         padding: const EdgeInsets.only(top: 5),
                          //         child: IconButton(
                          //             onPressed: () {
                          //               setState(() {
                          //                 studentData.removeAt(index);
                          //                 print(studentData);
                          //               });
                          //             },
                          //             icon: const Icon(Icons.delete)),
                          //       ),
                          //       // Container(
                          //       //   height: 4,
                          //       //   padding: const EdgeInsets.only(top: 2),
                          //       //   child: IconButton(
                          //       //       onPressed: () {
                          //       //         setState(() {
                          //       //           studentData.removeAt(index);
                          //       //           print(studentData);
                          //       //         });
                          //       //       },
                          //       //       icon: const Icon(Icons.update)),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ],
          ),
          floatingActionButton: SizedBox(
            width: 60.0, // Specify the width
            height: 60.0, // Specify the height
            child: FloatingActionButton.small(
              backgroundColor: Colors.black,
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white, size: 25),
            ),
          ),
        ),
      ),
    );
  }
}
