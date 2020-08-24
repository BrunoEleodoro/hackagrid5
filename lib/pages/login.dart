import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackagrid5/pages/cadastro/cadastro.dart';
import 'package:hackagrid5/pages/home.dart';
import 'package:hackagrid5/pages/login/cadastro_fields.dart';
import 'package:hackagrid5/pages/login/login_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String type = "login";

  Future<String> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    try {
      Response res = await Dio().post('http://brunoeleodoro.com:4000/login',
          options: RequestOptions(
              data: {'CPF': data.name, 'Password': data.password}));
      print(res);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', res.data);
    } catch (ex) {
      print('ex');
      print(ex);
      return "Login ou senha errados!";
    }
    type = "login";
    return null;
  }

  Future<String> _singUp(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    type = "signup";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Gestão Fácil',
      logo: 'assets/login.png',
      onLogin: _authUser,
      onSignup: _singUp,
      emailValidator: (_) => null,
      onSubmitAnimationCompleted: () {
        print(type);
        if (type == "login") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => CadastroScreen(),
          ));
        }
      },
      messages: LoginMessages(
          usernameHint: 'CPF',
          signupButton: 'CADASTRAR',
          forgotPasswordButton: 'ESQUECEU A SENHA?',
          confirmPasswordHint: 'CONFIRME SUA SENHA',
          passwordHint: 'SENHA',
          confirmPasswordError: 'Senhas não são iguais'),
      onRecoverPassword: (_) => Future(null),
    );
  }
}

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool show = false;
//   int selectedIndex = 0;
//   PageController pageController = new PageController(initialPage: 0);
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () {
//       setState(() {
//         show = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: double.maxFinite,
//             margin: EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() => selectedIndex = 0);
//                     pageController.animateToPage(0,
//                         duration: Duration(milliseconds: 500),
//                         curve: Curves.easeIn);
//                   },
//                   child: Container(
//                       width: 150,
//                       child: Column(
//                         children: [
//                           Text('Login', style: TextStyle(fontSize: 25)),
//                           selectedIndex == 0
//                               ? Container(
//                                   margin: EdgeInsets.only(top: 10),
//                                   width: 100,
//                                   height: 3,
//                                   color: Colors.black,
//                                 )
//                               : SizedBox(),
//                         ],
//                       )),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() => selectedIndex = 1);
//                     pageController.animateToPage(1,
//                         duration: Duration(milliseconds: 500),
//                         curve: Curves.easeIn);
//                   },
//                   child: Container(
//                       width: 150,
//                       margin: EdgeInsets.only(left: 10),
//                       child: Column(
//                         children: [
//                           Text('Cadastre-se', style: TextStyle(fontSize: 25)),
//                           selectedIndex == 1
//                               ? Container(
//                                   margin: EdgeInsets.only(top: 10),
//                                   width: 100,
//                                   height: 3,
//                                   color: Colors.black,
//                                 )
//                               : SizedBox(),
//                         ],
//                       )),
//                 ),
//               ],
//             ),
//           ),
//           AnimatedOpacity(
//             duration: Duration(milliseconds: 600),
//             opacity: show ? 1 : 0,
//             child: Container(
//                 width: double.maxFinite,
//                 margin: EdgeInsets.only(top: 100),
//                 height: MediaQuery.of(context).size.height,
//                 child: PageView(
//                   controller: pageController,
//                   children: [LoginFields(), CadastroFields()],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
