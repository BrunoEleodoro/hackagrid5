import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_table/json_table.dart';
import 'package:url_launcher/url_launcher.dart';

class RelatoriosScreen extends StatefulWidget {
  @override
  _RelatoriosScreenState createState() => _RelatoriosScreenState();
}

class _RelatoriosScreenState extends State<RelatoriosScreen> {
  //Decode your json string

  @override
  Widget build(BuildContext context) {
    final String jsonSample =
        '[{"codigo_entrada":1,"tipo_de_entrada":"Transferência","valor":40,"horario":"10:00","cliente":"Maria José"},{"codigo_entrada":2,"tipo_de_entrada":"PIX","valor":35.9,"horario":"11:00","cliente":"Fernanda Marques"},{"codigo_entrada":3,"tipo_de_entrada":"PIX","valor":37,"horario":"11:30","cliente":"Joana Silva"},{"codigo_entrada":4,"tipo_de_entrada":"Boleto Bancário","valor":70,"horario":"13:00","cliente":"Flávia Simão"},{"codigo_entrada":5,"tipo_de_entrada":"Dinheiro","valor":100,"horario":"14:50","cliente":"Fernanda Marques"},{"codigo_entrada":6,"tipo_de_entrada":"PIX","valor":89.9,"horario":"16:20","cliente":"Jhenifer Lopes"}]';
    var json = jsonDecode(jsonSample);

    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          JsonTable(json, tableHeaderBuilder: (String header) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5), color: Colors.grey[300]),
              child: Text(
                header,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Colors.black87),
              ),
            );
          }, tableCellBuilder: (value) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Colors.grey.withOpacity(0.5))),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontSize: 14.0, color: Colors.grey[900]),
              ),
            );
          }),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              height: 50,
              onPressed: () async {
                const url =
                    'https://brunoeleodoro.github.io/hackagrid5/assets/assets/relatorio.pdf';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('PDF', style: TextStyle(color: Colors.white)),
                  Icon(
                    FontAwesomeIcons.filePdf,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
