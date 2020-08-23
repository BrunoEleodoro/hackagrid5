import 'package:flutter/material.dart';
import 'package:flutter_gauge/flutter_gauge.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0XFF4A2FA8),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          height: 700,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: FlutterGauge(
                          handSize: 30,
                          width: 200,
                          index: 65.0,
                          fontFamily: "Iran",
                          end: 100,
                          number: Number.endAndStart,
                          secondsMarker: SecondsMarker.minutes,
                          isCircle: false,
                          counterStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                        'Esse é seu score, continue melhorando ele para melhores condicoes!'),
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset('assets/login.png'),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
