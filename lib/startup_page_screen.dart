import 'package:flutter/material.dart';
import 'package:splashscreen/home_screen.dart';

class StartupPageScreen extends StatelessWidget {
  final int pageno;
  const StartupPageScreen({super.key, required this.pageno});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceOut,
            height: height * 0.2,
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: height * 0.4,
            width: width * 0.6,
            decoration: const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Center(
              child: Text(
                '$pageno',
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Column(
              children: [
                Text(
                  "Your title Goes",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Here!",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "lorem ipsum dollor sit amet,",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "consectetur adipiscing elit",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
