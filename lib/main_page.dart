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
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _loadCC();
          },
          label: Text('Refresh'),
          icon: Icon(Icons.refresh),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }

  _loadCC() async {
    final response =
        await http.get('https://api.coincap.io/v2/assets?limit=20');

    if (response.statusCode == 200) {
      var allData = (json.decode(response.body) as Map)['data'];
      // ignore: deprecated_member_use
      var ccDataList = List<CryptoModel>();
      allData.forEach((val) {
        var record = CryptoModel(
            name: val['name'],
            symbol: val['symbol'],
            price: double.parse(val['priceUsd']),
            rank: int.parse(val['rank']));
        ccDataList.add(record);
      });

      setState(() {
        data = ccDataList;
      });
    }
  }
}
