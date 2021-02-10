import 'dart:convert';

import 'package:cctracker/item_info_page.dart';
import 'package:cctracker/model/crypto_model.dart';
import 'package:cctracker/widgets/crypto_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListCrypto extends StatefulWidget {
  @override
  _ListCryptoState createState() => _ListCryptoState();
}

class _ListCryptoState extends State<ListCrypto> {
  List<CryptoModel> data = [];
  @override
  void initState() {
    super.initState();
    _loadCC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoCurrency'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _loadCC();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4.0),
                  width: 80.0,
                  child: Text(
                    "Rank",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                  width: 100,
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 0),
                  width: 80.0,
                  child: Text(
                    "Price",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 0, left: 9, right: 0),
                  width: 80.0,
                  child: Text(
                    "Ch(24hr)",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                CryptoModel cryptoModel = data[index];

                return CryptoItemWidget(
                    cryptoModel: cryptoModel,
                    onTapActorFunction: (cryptoModel) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemInfoPage(
                                  name: cryptoModel.name,
                                )),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  _loadCC() async {
    final response =
        await http.get('https://api.coincap.io/v2/assets?limit=50');

    if (response.statusCode == 200) {
      var allData = (json.decode(response.body) as Map)['data'];
      // ignore: deprecated_member_use
      var ccDataList = List<CryptoModel>();
      allData.forEach((val) {
        var record = CryptoModel(
            name: val['name'],
            symbol: val['symbol'],
            price: double.parse(val['priceUsd']),
            rank: int.parse(val['rank']),
            changePercent24Hr: double.parse(val['changePercent24Hr']));

        ccDataList.add(record);
      });

      setState(() {
        data = ccDataList;
      });
    }
  }
}
