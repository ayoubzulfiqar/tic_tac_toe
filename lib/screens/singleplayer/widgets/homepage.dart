// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:tic_tac_toe/constants.dart';
// import 'package:tic_tac_toe/screens/singleplayer/widgets/gamepage.dart';
// import 'package:tic_tac_toe/welcome.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [AppColors.lightBlack, AppColors.darkBlack],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           title: Text(widget.title),
//           elevation: 0,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         "Tic",
//                         style: TextStyle(
//                           fontSize: 80,
//                           fontWeight: FontWeight.bold,
//                           shadows: [
//                             Shadow(
//                               blurRadius: 7.0,
//                               color: Colors.white,
//                               offset: Offset(0, 0),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         '-',
//                         style: TextStyle(
//                           fontSize: 80,
//                           fontWeight: FontWeight.bold,
//                           shadows: [
//                             Shadow(
//                               blurRadius: 7.0,
//                               color: Colors.white,
//                               offset: Offset(0, 0),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         "Tac",
//                         style: TextStyle(
//                           fontSize: 80,
//                           fontWeight: FontWeight.bold,
//                           shadows: [
//                             Shadow(
//                               blurRadius: 7.0,
//                               color: Colors.white,
//                               offset: Offset(0, 0),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Text(
//                     "Toe",
//                     style: TextStyle(
//                       fontSize: 80,
//                       fontWeight: FontWeight.bold,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 7.0,
//                           color: Colors.white,
//                           offset: Offset(0, 0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 50,
//               width: 200,
//               child: AnimatedTextKit(
//                 animatedTexts: [
//                   FadeAnimatedText(
//                     'Impossible Tic Tac Toe!',
//                     textStyle: const TextStyle(
//                         fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//                 repeatForever: true,
//               ),
//             ),
//             Center(
//                 child: Column(
//               children: [
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         fixedSize: const Size(300, 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(60)),
//                         primary: AppColors.lightBlack),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => GamePage(widget.title)));
//                     },
//                     child: const Text(
//                       "Let's Start",
//                       style: TextStyle(fontSize: 18),
//                     )),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         fixedSize: const Size(300, 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(60)),
//                         primary: AppColors.lightBlack),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const Welcome(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Go back",
//                       style: TextStyle(fontSize: 18),
//                     )),
//               ],
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
