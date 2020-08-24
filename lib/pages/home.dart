import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import "package:flutter_custom_credit_card_ui/flutter_custom_credit_card_ui.dart";
import 'package:hackagrid5/pages/gerar_pix/gerar_pix.dart';
import 'package:hackagrid5/pages/login.dart';
import 'package:hackagrid5/pages/relatorios/relatorios.dart';
import 'package:hackagrid5/pages/score/score.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  String option = "";

  void onClick(type) {
    setState(() {
      option = type;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Consentimento',
        desc:
            'Precisamos do seu consentimento dos seus dados\n\nConcorda conceder seus dados bancários?',
        btnCancelOnPress: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        },
        btnOkOnPress: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Response response = await Dio()
              .post('http://brunoeleodoro.com:4000/create-account-consent',
                  options: RequestOptions(data: {
                    "Data": {
                      "Permissions": [
                        "ReadAccountsBasic",
                        "ReadAccountsDetail",
                        "ReadBalances",
                        "ReadBeneficiariesBasic",
                        "ReadBeneficiariesDetail",
                        "ReadDirectDebits",
                        "ReadTransactionsBasic",
                        "ReadTransactionsCredits",
                        "ReadTransactionsDebits",
                        "ReadTransactionsDetail",
                        "ReadProducts",
                        "ReadStandingOrdersDetail",
                        "ReadProducts",
                        "ReadStandingOrdersDetail",
                        "ReadStatementsDetail",
                        "ReadParty",
                        "ReadOffers",
                        "ReadScheduledPaymentsBasic",
                        "ReadScheduledPaymentsDetail",
                        "ReadPartyPSU"
                      ]
                    },
                    "Risk": {}
                  }, headers: {
                    'Authorization': prefs.get('token')
                  }));
          print(response.data);
        },
      )..show();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedOption;
    if (option == "pix") {
      selectedOption = GerarPixScreen();
    } else if (option == "report") {
      selectedOption = RelatoriosScreen();
    }
    return Scaffold(
        backgroundColor: Color(0XFF4A2FA8),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CustomCreditCard(
                    cardNumber: "51293813********",
                    cardHolder: 'R\$ 1523,22',
                    year: 26,
                    month: 12,
                    isGradient: false,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height / 1.9,
                  // height: 100,
                  child: SingleChildScrollView(
                      child: option != ""
                          ? selectedOption
                          : MenuOptions(
                              onClick: onClick,
                            ))),
            ),
            option != ""
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          option = "";
                        });
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  )
                : SizedBox(),
          ],
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Início"),
            TabData(iconData: Icons.bar_chart, title: "Score"),
          ],
          onTabChangedListener: (position) {
            if (position == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScoreScreen(),
              ));
            } else {
              setState(() {
                currentPage = position;
              });
            }
          },
        ));
  }
}

class MenuOptions extends StatelessWidget {
  var onClick;
  MenuOptions({this.onClick});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            onClick("pix");
          },
          child: Container(
            width: 200,
            height: 200,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://s2.glbimg.com/XJP5s9s0EJEpdM-K0yWRmstm06s=/0x0:945x530/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2020/T/d/9KN7bBSd6UKk4hcitczA/marca-pix-1-.jpg',
                    width: 120,
                  ),
                  Text('PIX')
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onClick("report"),
          child: Container(
            width: 200,
            height: 200,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://www.resultatec.com.br/wp-content/uploads/2014/09/icon_-relatorios.png',
                    width: 120,
                  ),
                  Text('Gerar Relatorio')
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onClick("receber"),
          child: Container(
            width: 200,
            height: 200,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://image.flaticon.com/icons/png/512/988/988126.png',
                    width: 120,
                  ),
                  Text('Receber ou Pagar')
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onClick("boleto"),
          child: Container(
            width: 200,
            height: 200,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://www.growdeck.com.br/wp-content/uploads/2019/06/boleto-icon.png',
                    width: 120,
                  ),
                  Text('Boleto')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
