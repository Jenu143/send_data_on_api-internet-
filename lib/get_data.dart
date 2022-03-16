// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class GetDataScreen extends StatefulWidget {
//   const GetDataScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<GetDataScreen> createState() => _GetDataScreenState();
// }

// class _GetDataScreenState extends State<GetDataScreen> {
//   final url = "https://jsonplaceholder.typicode.com/posts";
//   List _postsJson = [];

//   void fetchPosts() async {
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//       );

//       final jsonData = jsonDecode(response.body) as List;
//       setState(() {
//         _postsJson = jsonData;
//       });
//     } catch (err) {
//       print("get error");
//     }
//     print("object : ${fetchPosts.toString()}");
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ListView.builder(
//         itemCount: _postsJson.length,
//         itemBuilder: (context, i) {
//           final post = _postsJson[i];
//           return Text(
//             "Name : ${post["name"]}",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
