import 'package:flutter/material.dart';

class textToText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _textToTextState();
}

class _textToTextState extends State<textToText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.lightGreen[400],
                    width: 400,
                    height: 80,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Drag and drop:',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 400,
                    height: 80,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 50.0),
                      child: Text(
                        'Question',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
