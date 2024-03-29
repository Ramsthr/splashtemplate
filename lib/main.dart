import 'package:flutter/material.dart';
import 'package:splashscreen/animes/fade.dart';
import 'package:splashscreen/resources/inputimageandtext.dart';
import 'package:splashscreen/screens/home_screen.dart';
import 'package:splashscreen/screens/startup_page_screen.dart';
import 'package:splashscreen/widget/pageroutewidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StartupPage(),
        '/home': (context) => const HomeScreen()
      },
    );
  }
}

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage>
    with TickerProviderStateMixin {
  final _controller = PageController();
  int currentpage = 0;
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(
      dataList.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
      ),
    );

    _animations = _animationControllers
        .map((controller) => Tween(begin: 0.0, end: 1.0).animate(controller))
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dataList.length,
          controller: _controller,
          itemBuilder: (context, index) {
            if (index == currentpage) {
              _animationControllers[index].forward();
            } else {
              _animationControllers[index].reverse();
            }
            return FadeInWidget(
              animation: _animations[index],
              child: StartupPageScreen(pageno: index),
            );
          }),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: MediaQuery.of(context).size.height * 0.11,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(
                dataList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeIn,
                    width: index == currentpage ? 50 : 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: const Icon(
                Icons.arrow_circle_right,
                size: 80,
                color: Colors.black54,
              ),
              onTap: () {
                _controller.nextPage(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.linear);
                setState(() {
                  currentpage++;
                });
                if (currentpage > 2) {
                  Navigator.of(context).push(pageRouteBuilderFunction(
                      Alignment.bottomRight, const HomeScreen()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
