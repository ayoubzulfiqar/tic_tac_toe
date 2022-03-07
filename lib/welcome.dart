import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/multiplayer/homepage.dart';
import 'package:tic_tac_toe/screens/multiplayer/play.dart';
import 'package:tic_tac_toe/screens/singleplayer/widgets/gamepage.dart';
import 'package:tic_tac_toe/screens/singleplayer/widgets/homepage.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.darkBlack, AppColors.lightBlack],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          // shrinkWrap: true,
          children: [
            const SizedBox(height: 80),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Tic",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 7.0,
                            color: Colors.white,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 7.0,
                            color: Colors.white,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Tac",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 7.0,
                            color: Colors.white,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Toe",
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 7.0,
                        color: Colors.white,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 200),
            Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Checkbox(
                //         checkColor: Colors.white,
                //         activeColor: Colors.black,
                //         value: value,
                //         onChanged: (bool? newValue) {
                //           setState(() {
                //             value = newValue!;
                //           });
                //         }),
                //     const Text(
                //         "By Clicking on 'Let's Play', you agree with our Term of\nService and that you read over Privacy Policy ")
                //   ],
                // ),
                const SizedBox(height: 60),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),
                        primary: AppColors.lightBlack),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const GamePage("Tic Tac Toe")),
                      );
                    },
                    child: const Text(
                      'Single Player',
                      style: TextStyle(fontSize: 19),
                    )),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),
                        primary: AppColors.lightBlack),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MultiPlayerHomePage()));
                    },
                    child: const Text(
                      'Multi Player',
                      style: TextStyle(fontSize: 19),
                    )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        checkColor: Colors.black,
                        activeColor: Colors.white,
                        value: value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue!;
                          });
                        }),
                    const Text(
                      "By clicking on 'Play', you agree with our Term of\nService and that you read over Privacy Policy ",
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
