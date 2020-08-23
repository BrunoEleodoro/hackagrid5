import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MEI Facil',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 400,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Numero do Celular',
                                  prefixIcon: Icon(Icons.phone)),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Data de nascimento',
                                  prefixIcon: Icon(Icons.person)),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: MaterialButton(
                                color: Theme.of(context).primaryColor,
                                height: 50,
                                onPressed: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SelectableText('FINALIZAR CADASTRO',
                                        style: TextStyle(color: Colors.white)),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
