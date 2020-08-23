import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 150,
                    child: Column(
                      children: [
                        Text('Login', style: TextStyle(fontSize: 25)),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 100,
                          height: 3,
                          color: Colors.black,
                        ),
                      ],
                    )),
                Container(
                    width: 150,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text('Cadastre-se', style: TextStyle(fontSize: 25)),
                      ],
                    )),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Olá, facilite a gestão de seu negócio!',
                      style: TextStyle(fontSize: 35)),
                  SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.facebookF,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        FontAwesomeIcons.googlePlusSquare,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 100,
                color: Color(0XFFE9E8E9),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(bottom: 70, right: 40),
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(Icons.navigate_next_outlined),
              ))
        ],
      ),
    );
  }
}
