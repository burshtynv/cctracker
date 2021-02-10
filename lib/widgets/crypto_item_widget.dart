import 'package:cctracker/model/crypto_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../item_info_page.dart';

class CryptoItemWidget extends StatelessWidget {
  final CryptoModel cryptoModel;
  final Function(CryptoModel obj) onTapActorFunction;

  const CryptoItemWidget({Key key, this.cryptoModel, this.onTapActorFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapActorFunction(cryptoModel),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0),
          ),
          height: 45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                child: Center(
                  child: Text(
                    cryptoModel.rank.toString() + '.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    shape: BoxShape.circle,
                    // You can use like this way or like the below line
                    //borderRadius: new BorderRadius.circular(30.0),
                    color: Colors.blue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        cryptoModel.symbol,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 0),
                child: Container(
                  width: 110,
                  child: Text(
                    cryptoModel.name,
                    style: TextStyle(color: Colors.red, fontSize: 17),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 40),
                child: Container(
                  width: 80,
                  child: Text((cryptoModel.price.toStringAsFixed(1)) + ' \$',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 5),
                child: Text(
                    (cryptoModel.changePercent24Hr.toStringAsFixed(1)) + ' %',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
