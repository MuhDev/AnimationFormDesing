import 'package:flutter/material.dart';
import 'package:flutter_form_animation/components/login_form.dart';
import 'package:flutter_form_animation/components/register_form.dart';
import 'components/side_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  bool isLoginForm = true;
  late final AnimationController _controller;
  late final Animation<Offset> _positionAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: const Duration(milliseconds: 1300));
    _positionAnimation=Tween<Offset>(
      begin: const Offset(0,0),end: const Offset(0.75,0)
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
  }
  void toggleForm() {
    if(isLoginForm) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      isLoginForm = !isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcac1d3),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              height: 450,
              width: 750,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SideCard(
                    assetPath: "assets/images/Flow1.png",
                    textInsideTheButton: "LOGIN",
                    textAboveTheButton: "have an account?",
                    toggleForm: toggleForm,
                  ),
                  SideCard(
                    assetPath: "assets/images/Flower2.png",
                    textInsideTheButton: "SIGN UP",
                    textAboveTheButton: "don't have an account?",
                    toggleForm: toggleForm,
                  )
                ],
              ),
            ),
            SlideTransition(
              position: _positionAnimation,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 550,
                width: 350,
                decoration: BoxDecoration(
                    color: const Color(0xffeccacb),
                    borderRadius: BorderRadius.circular(10)),
                child: AnimatedCrossFade(
                  crossFadeState: isLoginForm
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500),
                  firstChild: const LoginForm(),
                  secondChild: const RegisterForm(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
