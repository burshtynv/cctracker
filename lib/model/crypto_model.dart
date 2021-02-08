import 'package:flutter/foundation.dart';

class CryptoModel {
  final String name;
  final String symbol;
  final int rank;
  final double price;
  final double explorer;
  final double changePercent24Hr;

  const CryptoModel({
    this.name,
    this.symbol,
    this.rank,
    this.price,
    this.explorer,
    this.changePercent24Hr,
  });
}
