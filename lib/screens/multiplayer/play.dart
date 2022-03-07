// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:tic_tac_toe/constants.dart';
// import 'package:tic_tac_toe/screens/multiplayer/homepage.dart';
// import 'package:tic_tac_toe/welcome.dart';

// class LetsPlay extends StatefulWidget {
//   const LetsPlay({Key? key}) : super(key: key);

//   @override
//   State<LetsPlay> createState() => _LetsPlayState();
// }

// class _LetsPlayState extends State<LetsPlay> {
//   TextEditingController firstUsername = TextEditingController();
//   TextEditingController secondUsername = TextEditingController();

//   String firstName = '';
//   String secondName = '';

//   void getFirstUsername() async {
//     final SharedPreferences firstPrefs = await SharedPreferences.getInstance();
//     setState(() {
//       firstName = firstPrefs.getString("firstUser")!;
//     });
//   }

//   void getSecondUsername() async {
//     final SharedPreferences secondPrefs = await SharedPreferences.getInstance();
//     setState(() {
//       secondName = secondPrefs.getString("secondUser")!;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getFirstUsername();
//     getSecondUsername();
//   }

//   @override
//   void dispose() {
//     getSecondUsername();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [AppColors.darkBlack, AppColors.lightBlack],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: ListView(
//           // shrinkWrap: true,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 10),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Welcome()));
//                     },
//                     icon: const Icon(Icons.arrow_back)),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 130),
//                 SizedBox(
//                   height: 100,
//                   width: 200,
//                   child: AnimatedTextKit(
//                     animatedTexts: [
//                       FadeAnimatedText(
//                         "Let's Play",
//                         textStyle: const TextStyle(
//                           fontSize: 50.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         // speed: const Duration(milliseconds: 2000),
//                       ),
//                     ],
//                     repeatForever: true,
//                     // onFinished: () {
//                     //   Navigator.push(context,
//                     //       MaterialPageRoute(builder: (context) => const HomePage()));
//                     // },
//                   ),
//                 ),
//                 const SizedBox(height: 100),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: firstUsername,
//                         textCapitalization: TextCapitalization.sentences,
//                         keyboardType: TextInputType.text,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(20),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                           labelText: 'First Username',
//                           labelStyle: TextStyle(color: Colors.grey),
//                           hintText: 'first username',
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       TextField(
//                         controller: secondUsername,
//                         textCapitalization: TextCapitalization.sentences,
//                         keyboardType: TextInputType.text,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(20),
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                           ),
//                           labelText: 'Second Username',
//                           labelStyle: TextStyle(color: Colors.grey),
//                           hintText: 'second username',
//                         ),
//                       ),
//                       const SizedBox(height: 50),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               fixedSize: const Size(300, 50),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(60)),
//                               primary: AppColors.lightBlack),
//                           onPressed: () {
//                             String user1 = firstUsername.text;
//                             String user2 = secondUsername.text;

//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const HomePage()));
//                           },
//                           child: const Text(
//                             "Let's Go",
//                             style: TextStyle(fontSize: 18),
//                           ))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
