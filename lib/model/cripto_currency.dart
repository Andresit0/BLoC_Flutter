import 'package:equatable/equatable.dart';

class CriptoCurrency extends Equatable {
  final String name;
  final String symbol;
  final double price;

  const CriptoCurrency({
    required this.name,
    required this.symbol,
    required this.price,
  });

  factory CriptoCurrency.from(Map<String, dynamic> json) {
    return CriptoCurrency(
      name: json['name'],
      symbol: json['symbol'],
      price: json['current_price'].toDouble(),
    );
  }

  CriptoCurrency copyWith({
    String? name,
    String? symbol,
    double? price,
  }) =>
      CriptoCurrency(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        price: price ?? this.price,
      );

  @override
  String toString() => 'name: $name, symbol: $symbol, price: $price';

  @override
  List<Object?> get props => [name, symbol, price];
}
