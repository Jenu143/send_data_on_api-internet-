import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sending_data_on_internet/get_data.dart';
import 'package:sending_data_on_internet/main.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    ),
  );
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController macidController = TextEditingController();
  final TextEditingController profilepicController = TextEditingController();
  final TextEditingController useridController = TextEditingController();
  final TextEditingController ltypeController = TextEditingController();
  final TextEditingController dtypeController = TextEditingController();
  final TextEditingController lfriendController = TextEditingController();

  var respons;

//post method
  void postData() async {
    try {
      final response = await http.post(
          Uri.parse(
              "https://us-central1-international-dress-up.cloudfunctions.net/ludo/mLoginRegister"),
          body: {
            "name": nameController.text,
            "macid": macidController.text,
            "profilepic": profilepicController.text,
            "userid": useridController.text,
            "ltype": ltypeController.text,
            "dtype": dtypeController.text,
            "lfriend": lfriendController.text,
          });
      print(response.body);
      setState(() {
        respons = response.body;
      });
    } catch (er) {
      print("object");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ListView.builder(itemCount: ,)

                SizedBox(height: 100),
                // name
                TextTilesFileds(
                  controller: nameController,
                  hintText: "Name",
                ),
                const SizedBox(height: 15),

                // macid
                TextTilesFileds(
                  controller: macidController,
                  hintText: "macid",
                ),
                const SizedBox(height: 15),

                // profilepic
                TextTilesFileds(
                  controller: profilepicController,
                  hintText: "profilepic",
                ),
                const SizedBox(height: 15),

                // userid
                TextTilesFileds(
                  controller: useridController,
                  hintText: "userid",
                ),
                const SizedBox(height: 15),

                // ltype
                TextTilesFileds(
                  controller: ltypeController,
                  hintText: "ltype",
                ),
                const SizedBox(height: 15),

                // dtype
                TextTilesFileds(
                  controller: dtypeController,
                  hintText: "dtype",
                ),
                const SizedBox(height: 15),

                // lfriend
                TextTilesFileds(
                  controller: lfriendController,
                  hintText: "lfriend",
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: postData,
                      child: const Text("Send Deta"),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Text("Response : ${respons} "),

                // Row(
                //   children: [
                //     SizedBox(width: 40),
                //     ElevatedButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => Scaffold(
                //               body: GetDataScreen(),
                //             ),
                //           ),
                //         );
                //       },
                //       child: Text("Get Data"),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//text fields
class TextTilesFileds extends StatelessWidget {
  const TextTilesFileds({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          height: 45,
          child: TextField(
            controller: controller,
            cursorColor: Colors.green.shade600,
            cursorWidth: 2.5,
            cursorHeight: 25,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.only(left: 15),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
