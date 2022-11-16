import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Color buttonTextColor = const Color(0xffeccbd2);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "SIGN IN",
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 4),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  hintText: "username",
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                  prefix: SizedBox(
                    width: 15,
                  )),
            ),
          ),
           const SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                hintText: "password",
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
                prefix: SizedBox(
                  width: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white),
              ),
              const Text(
                " remember me",
                style: TextStyle(
                  color: Color(0xffcd999e),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton(
            onPressed: () {},
            onHover: (isHover) {
              if (isHover) {
                setState(() {
                  buttonTextColor = Colors.white;
                });
              } else {
                setState(() {
                  buttonTextColor = const Color(0xffeccbd2);
                });
              }
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                const Color(0xffeccbd2),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: SizedBox(
              width: 70,
              height: 40,
              child: Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: buttonTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
