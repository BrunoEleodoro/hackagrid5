import 'package:flutter/material.dart';
import 'package:hackagrid5/pages/home.dart';

class EscolherBancoScreen extends StatefulWidget {
  @override
  _EscolherBancoScreenState createState() => _EscolherBancoScreenState();
}

class _EscolherBancoScreenState extends State<EscolherBancoScreen> {
  var bankList = [
    {
      'title': 'Caixa Econômica Federal',
      'image':
          'https://seeklogo.com/images/C/caixa-economica-federal-logo-00F5A18C90-seeklogo.com.png'
    },
    {
      'title': 'Itaú',
      'image':
          'https://www.itau.com.br/content/dam/itau/varejo/logo-itau-varejo-desktop.png'
    },
    {
      'title': 'Bradesco',
      'image':
          'https://i.pinimg.com/originals/69/0a/34/690a348df1b1cc7f3847246ddfe37743.jpg'
    }
  ];
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
                  style: TextStyle(color: Colors.white, fontSize: 40),
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
                            Text(
                              'Escolha seu banco:',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListView.builder(
                                itemCount: bankList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          bankList[index]['image']),
                                    ),
                                    title: Text(bankList[index]['title']),
                                    onTap: () {},
                                  );
                                }),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: MaterialButton(
                                color: Theme.of(context).primaryColor,
                                height: 50,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SelectableText('PROXIMO',
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
