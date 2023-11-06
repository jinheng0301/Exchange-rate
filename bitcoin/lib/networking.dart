import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const APIKey = '71D5D184-579F-417F-A69C-CE55291B0696';
const List<String> coinTypes = ['BTC', 'ETH', 'MYR', 'SGD', 'EUR', 'CNY', 'USD'];

class Network_Helper extends StatefulWidget {
  String value;
  Network_Helper(this.value);

  @override
  State<Network_Helper> createState() => _Network_HelperState();
}

class _Network_HelperState extends State<Network_Helper> {
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    List<double> exchangeData = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

    try {
      for (int i = 0; i < coinTypes.length; i++) {
        String url =
            'https://rest.coinapi.io/v1/exchangerate/${coinTypes[i]}/${widget.value}?apikey=$APIKey';
        http.Response data = await http.get(
          Uri.parse(url),
        );
        // print(data.statusCode);
        double rate = jsonDecode(data.body)['rate'].toDouble();
        exchangeData[i] = rate;
      }
      Navigator.pop(context, exchangeData);
      //return exchangeData;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Center(
        child: SpinKitPumpingHeart(
          color: Colors.blue,
          size: 50,
        ),
      ),
    );
  }
}
