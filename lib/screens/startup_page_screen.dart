import 'package:flutter/material.dart';
import 'package:splashscreen/resources/inputimageandtext.dart';
import 'package:splashscreen/screens/home_screen.dart';
import 'package:splashscreen/widget/pageroutewidget.dart';

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
          Container(
            height: height * 0.2,
            padding: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(pageRouteBuilderFunction(
                    Alignment.topRight, const HomeScreen()));
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
            decoration: BoxDecoration(
              color: Colors.black45,
              image: DecorationImage(
                  image: AssetImage(dataList[pageno].imageUrl),
                  fit: BoxFit.fill),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  dataList[pageno].bigText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dataList[pageno].smallText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
