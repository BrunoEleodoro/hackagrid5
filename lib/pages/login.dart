import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackagrid5/pages/cadastro/cadastro.dart';
import 'package:hackagrid5/pages/login/cadastro_fields.dart';
import 'package:hackagrid5/pages/login/login_fields.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<String> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    if (data.name == "abc") {
      return "error";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'MEI Facil',
      logo: 'assets/login.png',
      onLogin: _authUser,
      onSignup: (_) => Future(null),
      emailValidator: (_) => null,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => CadastroScreen(),
        ));
      },
      messages: LoginMessages(
        usernameHint: 'CPF',
        signupButton: 'CADASTRAR',
        forgotPasswordButton: 'ESQUECEU A SENHA?',
        confirmPasswordHint: 'CONFIRME SUA SENHA',
        passwordHint: 'SENHA',
      ),
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
