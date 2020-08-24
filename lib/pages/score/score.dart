import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gauge/flutter_gauge.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  double porcentage = 0;

  void getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await Dio().get(
        'http://brunoeleodoro.com:4000/meu-score',
        options:
            RequestOptions(headers: {'Authorization': prefs.get('token')}));
    print(response.data);
    var resultado_final_do_score =
        double.parse(response.data['registro'][1]['resultado_final_do_score']);
    setState(() {
      porcentage = double.parse(
          response.data['registro'][1]['resultado_final_do_score']);
    });

    print(resultado_final_do_score);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getScore();
    });
  }

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
                    (porcentage == 0)
                        ? SizedBox()
                        : Expanded(
                            child: FlutterGauge(
                                handSize: 30,
                                width: 200,
                                index: porcentage,
                                fontFamily: "Iran",
                                end: 670,
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
