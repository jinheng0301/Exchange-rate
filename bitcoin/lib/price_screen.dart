import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin/networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String selectedCryptoCurrency = 'BTC';

  List<double> rates = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

  // List<DropdownMenuItem<String>> getDropdownItems() {
  //   List<DropdownMenuItem<String>> dropdownItems = [];
  //   for (int i = 0; i < currenciesList.length; i++) {
  //     String currency = currenciesList[i];
  //     var newItem = DropdownMenuItem<String>(
  //       child: Text(currency),
  //       value: currency,
  //     );
  //     dropdownItems.add(newItem);
  //   }
  //   return dropdownItems;
  // }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem<String>(
        child: Text(currency),
        value: currency,
      );

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value!;
            print(value);
          },
        );
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = []; //output is gonna be a text widget

    for (String currency in currenciesList) {
      pickerItems.add(
        Text(currency),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.blue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  // Widget getPicker(){
  //   if(Platform.isIOS){
  //     return iOSPicker();
  //   }
  //   else if(Platform.isAndroid){
  //     return androidDropdown();
  //   }
  // }

  Future getExchangeData(String value) async {
    // Network_Helper networkHelper = Network_Helper(value);
    rates = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Network_Helper(value);
        },
      ),
    ) as List<double>;
    setState(
      () {
        selectedCurrency = value;
      },
    );
  }

  void swapEachCurrencyForCard(int cardIndex) {
    setState(
      () {
        final temp = selectedCurrency;
        selectedCurrency = selectedCryptoCurrency;
        selectedCryptoCurrency = temp;
        getExchangeData(selectedCurrency);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '🤑 Coin Ticker',
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       '1 $selectedCryptoCurrency = ${rates[0].toStringAsFixed(3)} $selectedCurrency',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         fontSize: 20.0,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     IconButton(
                    //       icon: Icon(Icons.swap_horiz),
                    //       onPressed: () {
                    //         swapEachCurrencyForCard(0);
                    //       },
                    //     ),
                    //   ],
                    // ),
                    child: Text(
                      '1 BTC = ${rates[0].toStringAsFixed(3)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 ETH = ${rates[1].toStringAsFixed(3)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 MYR = ${rates[2].toStringAsFixed(3)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 SGD = ${rates[3].toStringAsFixed(3)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 EUR = ${rates[4].toStringAsFixed(3)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 CNY = ${rates[5].toStringAsFixed(3)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 USD = ${rates[6].toStringAsFixed(3)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: 150.0,
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.only(bottom: 30.0),
              //   color: Colors.blue,
              //   // child: Platform.isIOS ? iOSPicker() : androidDropdown(),
              //   child: iOSPicker(),
              // ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  color: Colors.amber,
                ),
                height: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30.0),
                child: DropdownButton<String>(
                  dropdownColor: Colors.black,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle_rounded,
                  ),
                  iconEnabledColor: Color(0xFF37474F),
                  elevation: 10,
                  value: selectedCurrency,
                  items: androidDropdown().items,
                  onChanged: (value) {
                    setState(
                      () {
                        selectedCurrency = value!;
                      },
                    );
                    getExchangeData(
                      selectedCurrency,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
