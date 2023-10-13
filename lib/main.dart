import 'package:flutter/material.dart';
import 'package:splashscreen/animes/fade.dart';
import 'package:splashscreen/home_screen.dart';
import 'package:splashscreen/startup_page_screen.dart';

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

  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(
      3,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 5000),
      ),
    );

    var pi = 22 / 7;
    _scaleAnimation =
        CurvedAnimation(parent: _animationControllers[0], curve: Curves.linear);
    _opacityAnimation = CurvedAnimation(
        parent: _animationControllers[0], curve: Curves.bounceOut);
    _rotationAnimation =
        Tween(begin: 0.0, end: 2 * pi).animate(_animationControllers[2]);

    _animations = [_scaleAnimation, _opacityAnimation, _rotationAnimation];

    // _animations = _animationControllers
    //     .map((controller) => Tween(begin: 0.0, end: 1.0).animate(controller))
    //     .toList();
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
          itemCount: 3,
          controller: _controller,
          itemBuilder: (context, index) {
            _animationControllers[index].forward();
            return FadeInWidget(
              animation: _animations[index],
              child: StartupPageScreen(pageno: index + 1),
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
                3,
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
                  Navigator.popAndPushNamed(context, '/home');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
