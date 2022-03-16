// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:sending_data_on_internet/album.dart';
// import 'package:sending_data_on_internet/test.dart';

// Future<Album> createAlbum(
//   String name,
//   String macid,
//   String profilepic,
//   String userid,
//   String ltype,
//   String dtype,
//   String lfriend,
// ) async {
//   final response = await http.post(
//     Uri.parse(
//         'https://us-central1-international-dress-up.cloudfunctions.net/ludo/mLoginRegister'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'name': name,
//       'macid': macid,
//       'profilepic': profilepic,
//       'userid': userid,
//       'ltype': ltype,
//       'dtype': dtype,
//       'lfriend': lfriend,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }


// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController macidController = TextEditingController();
//   final TextEditingController profilepicController = TextEditingController();
//   final TextEditingController useridController = TextEditingController();
//   final TextEditingController ltypeController = TextEditingController();
//   final TextEditingController dtypeController = TextEditingController();
//   final TextEditingController lfriendController = TextEditingController();
//   Future<Album>? _futureAlbum;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Create Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Create Data Example'),
//           ),
//           body: Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(8.0),
//             child:
//                 (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
//           ),
//         ),
//       ),
//     );
//   }

// //build column
//   Padding buildColumn() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 15),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             // name
//             TextTilesFileds(
//               controller: nameController,
//               hintText: "Name",
//             ),
//             const SizedBox(height: 15),

//             // macid
//             TextTilesFileds(
//               controller: macidController,
//               hintText: "macid",
//             ),
//             const SizedBox(height: 15),

//             // profilepic
//             TextTilesFileds(
//               controller: profilepicController,
//               hintText: "profilepic",
//             ),
//             const SizedBox(height: 15),

//             // userid
//             TextTilesFileds(
//               controller: useridController,
//               hintText: "userid",
//             ),
//             const SizedBox(height: 15),

//             // ltype
//             TextTilesFileds(
//               controller: ltypeController,
//               hintText: "ltype",
//             ),
//             const SizedBox(height: 15),

//             // dtype
//             TextTilesFileds(
//               controller: dtypeController,
//               hintText: "dtype",
//             ),
//             const SizedBox(height: 15),

//             // lfriend
//             TextTilesFileds(
//               controller: lfriendController,
//               hintText: "lfriend",
//             ),
//             const SizedBox(height: 20),

//             // create data button
//             ElevatedButton(
//               onPressed: () {
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
//                 setState(() {
//                   _futureAlbum = createAlbum(
//                     nameController.text,
//                     macidController.text,
//                     profilepicController.text,
//                     useridController.text,
//                     ltypeController.text,
//                     dtypeController.text,
//                     lfriendController.text,
//                   );
//                 });
//               },
//               child: const Text('Create Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// //builder
//   FutureBuilder<Album> buildFutureBuilder() {
//     return FutureBuilder<Album>(
//       future: _futureAlbum,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Column(
//             children: [
//               Text(snapshot.data!.name),
//               Text(snapshot.data!.macid),
//               Text(snapshot.data!.profilepic),
//               Text(snapshot.data!.userid),
//               Text(snapshot.data!.ltype),
//               Text(snapshot.data!.dtype),
//               Text(snapshot.data!.lfriend),
//             ],
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }

//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }

// class TextTilesFileds extends StatelessWidget {
//   const TextTilesFileds({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String hintText;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 200,
//           height: 45,
//           child: TextField(
//             controller: controller,
//             cursorColor: Colors.green.shade600,
//             cursorWidth: 2.5,
//             cursorHeight: 25,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             decoration: InputDecoration(
//               hintText: hintText,
//               contentPadding: const EdgeInsets.only(left: 15),
//               border: const OutlineInputBorder(),
//               focusedBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.green, width: 1.5),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
