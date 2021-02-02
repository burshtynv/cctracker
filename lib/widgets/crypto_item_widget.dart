import 'package:cctracker/model/crypto_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: Text(cryptoModel.symbol),
                backgroundColor: Colors.blue,
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
