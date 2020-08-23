import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF4A2FA8),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CreditCardWidget(
                  cardNumber: '5129381344397012',
                  expiryDate: '08/22',
                  cardHolderName: 'R\$1523,22',
                  cvvCode: '123',
                  showBackView: false,
                  animationDuration: Duration(milliseconds: 500),
                  height: 250,
                  width: double.maxFinite),
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
                height: MediaQuery.of(context).size.height / 1.8,
                child: Center(
                  child: Text('Teste'),
                ),
              ),
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
