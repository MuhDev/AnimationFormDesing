import 'package:flutter/material.dart';
class SideCard extends StatefulWidget {
  final String assetPath;
  final String textAboveTheButton;
  final String textInsideTheButton;
  final Function toggleForm;
  const SideCard({
    required this.assetPath,
    required this.textAboveTheButton,
    required this.textInsideTheButton,
    required this.toggleForm,
    Key? key,
  }) : super(key: key);

  @override
  State<SideCard> createState() => _SideCardState();
}

class _SideCardState extends State<SideCard> {
  Color buttonTextColor = const Color(0xffeccbd2);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "BLOOM",
                    style: TextStyle(
                        fontFamily: "Alike",
                        color: Color(0xffeccbd2),
                        fontWeight: FontWeight.w100,
                        fontSize: 25,
                        letterSpacing: 5),
                  ),
                  TextSpan(
                    text: "&",
                    style: TextStyle(
                        fontFamily: "Alike",
                        color: Color(0xff919193),
                        fontWeight: FontWeight.w100,
                        fontSize: 25,
                        letterSpacing: 5),
                  ),
                ],
              ),
            ),
            const Text(
              "BOUQUET",
              style: TextStyle(
                  fontFamily: "Alike",
                  color: Color(0xff919193),
                  fontWeight: FontWeight.w100,
                  fontSize: 25,
                  letterSpacing: 5),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "pick your perefect ",
                    style: TextStyle(
                      color: Color(0xff919193),
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: "bouquet",
                    style: TextStyle(
                      color: Color(0xffeccbd2),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              widget.assetPath,
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.textAboveTheButton,
              style: const TextStyle(
                color: Color(0xff919193),
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: (){
                widget.toggleForm();
              },
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
                    widget.textInsideTheButton,
                    style: TextStyle(
                        color: buttonTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
