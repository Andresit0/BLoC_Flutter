part of 'cripto_currency_list_bloc.dart';

@immutable
abstract class CriptoCurrencyListEvent {}

class CriptocurrencyLoadingEvent extends CriptoCurrencyListEvent {}

//No used now
class CriptoCurrencyListUpdate extends CriptoCurrencyListEvent {
  final List<CriptoCurrency> criptoCurrency;
  CriptoCurrencyListUpdate(this.criptoCurrency);
}
