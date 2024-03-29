import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // ignore: override_on_non_overriding_member
  List studentData = [
    "Ebad",
    "Osama",
    "Ali",
    'AJmal',
    "Amar",
    "Akbar",
    "Anthony"
  ];
  TextEditingController addItemcontroller = TextEditingController();
  TextEditingController updateItemcontroller = TextEditingController();
  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  controller: addItemcontroller,
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
                        height: 80,
                        child: ListTile(
                          title: Text("${studentData[index]}"),
                          trailing: Container(
                            padding: const EdgeInsets.only(left: 4),
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.update,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Update'),
                                        content: SizedBox(
                                          height: 45,
                                          child: TextField(
                                            controller: updateItemcontroller,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter text to update",
                                                hintStyle: const TextStyle(
                                                    fontSize: 13),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50))),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                studentData[index] =
                                                    updateItemcontroller.text;
                                                updateItemcontroller.clear();
                                              });

                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      studentData.removeAt(index);
                                    });
                                    // Handle delete button press
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          floatingActionButton: SizedBox(
            width: 50.0, // Specify the width
            height: 50.0, // Specify the height
            child: FloatingActionButton.small(
              backgroundColor: Colors.black,
              onPressed: () {
                setState(() {
                  studentData.add(addItemcontroller.text);
                  addItemcontroller.clear();
                });
              },
              child: const Icon(Icons.add, color: Colors.white, size: 25),
            ),
          ),
        ),
      ),
    );
  }
}
