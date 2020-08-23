import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import "package:flutter_custom_credit_card_ui/flutter_custom_credit_card_ui.dart";

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

  @override
  Widget build(BuildContext context) {
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
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
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
                        Container(
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
                        Container(
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
                        Container(
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
                      ],
                    ),
                  )),
            )
          ],
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Início"),
            TabData(iconData: Icons.bar_chart, title: "Relatórios"),
            TabData(iconData: Icons.shopping_cart, title: "Basket")
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }
}
