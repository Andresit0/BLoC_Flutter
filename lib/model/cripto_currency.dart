class CriptoCurrency {
  final String name;
  final String symbol;
  final double price;

  CriptoCurrency({
    required this.name,
    required this.symbol,
    required this.price,
  });

  factory CriptoCurrency.from(Map<String, dynamic> json) {
    return CriptoCurrency(
      name: json['name'],
      symbol: json['symbol'],
      price: json['current_price'],
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CriptoCurrency &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          symbol == other.symbol &&
          price == other.price;

  @override
  int get hashCode => name.hashCode ^ symbol.hashCode ^ price.hashCode;

  @override
  String toString() => 'name: $name, symbol: $symbol, price: $price';
}
