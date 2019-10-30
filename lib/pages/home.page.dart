import 'package:comparador/widgets/logo.widget.dart';
import 'package:comparador/widgets/submit-form.dart';
import 'package:comparador/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl= new MoneyMaskedTextController();

  var _etaCtrl= new MoneyMaskedTextController();

  var _busy =false;

  var _completed =true;

  var _resulText ="É Mehlor usar Etanol";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).primaryColor,
     body: ListView(
       children: <Widget>[
         Logo(),
         _completed? Success(reset: (){},result: _resulText,):
         SubmitForm(
           etaCtrl: _etaCtrl,
           gasCtrl: _gasCtrl,
           submitFunc: calculate,
           busy: false,
         )
               
       ],
     ),
    );

  Future calculate(){

    double eta =double.parse(_etaCtrl.text.replaceAll(r'[,.]',''))/100;
    double gas =double.parse(_gasCtrl.text.replaceAll(r'[,.]',''))/100;
    double res =eta/gas;
  

    setState(() {
        _completed =false;
    _busy=true;

    });

  }


  }
}