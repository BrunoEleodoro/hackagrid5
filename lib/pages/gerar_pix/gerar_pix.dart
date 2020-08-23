import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GerarPixScreen extends StatefulWidget {
  @override
  _GerarPixScreenState createState() => _GerarPixScreenState();
}

class _GerarPixScreenState extends State<GerarPixScreen> {
  TextEditingController valorReceber = new TextEditingController();

  void gerarPIX() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Response response =
        await Dio().post('http://brunoeleodoro.com:4000/create-payment',
            options: RequestOptions(data: {
              "currency": "BRL",
              "amount": valorReceber.text,
              "debtor_user_email": "josesilva@gmail.com"
            }, headers: {
              'Authorization': prefs.getString('token')
            }));
    print(response.data);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Receber:',
      desc: response.data['Data']['message'],
      body: Container(
        child: QrImage(
          data: response.data['Data']['ConsentId'],
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Gerar PIX de pagamento',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              SizedBox(
                height: 40,
              ),
              Text('Valor a ser recebido', style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                child: TextFormField(
                  controller: valorReceber,
                  style: TextStyle(fontSize: 28),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.monetization_on),
                      prefixText: 'R\$'),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  onPressed: gerarPIX,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText('GERAR QRCODE',
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
      ),
    );
  }
}
