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
      child: Container(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
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
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cryptoModel.name,
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
            Text((cryptoModel.price.toStringAsFixed(1)) + ' \$',
                style: TextStyle(color: Colors.black, fontSize: 18))
          ],
        ),
      ),
    );
  }
}
