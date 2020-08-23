import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CadastroFields extends StatefulWidget {
  @override
  _CadastroFieldsState createState() => _CadastroFieldsState();
}

class _CadastroFieldsState extends State<CadastroFields> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cadastre-se!', style: TextStyle(fontSize: 35)),
            SizedBox(
              height: 80,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Numero do Celular', prefixIcon: Icon(Icons.phone)),
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
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'CPF', prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Senha', prefixIcon: Icon(Icons.lock)),
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
                    SelectableText('CADASTRAR',
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
    );
  }
}
