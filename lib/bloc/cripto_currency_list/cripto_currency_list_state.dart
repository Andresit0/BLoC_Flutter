part of 'cripto_currency_list_bloc.dart';

@immutable
abstract class CriptoCurrencyListState {
  final bool existCriptoCurrency;
  final List<CriptoCurrency>? listCriptoCurrency;

  const CriptoCurrencyListState({
    this.existCriptoCurrency = false,
    this.listCriptoCurrency,
  });
}

class CriptoCurrencyInitialState extends CriptoCurrencyListState {
  const CriptoCurrencyInitialState()
      : super(existCriptoCurrency: false, listCriptoCurrency: null);
}

class CriptoCurrencySetState extends CriptoCurrencyListState {
  final List<CriptoCurrency>? newListCriptoCurrency;
  const CriptoCurrencySetState(this.newListCriptoCurrency)
      : super(
            existCriptoCurrency: true,
            listCriptoCurrency: newListCriptoCurrency);
}

class CriptocurrencyLoadedState extends CriptoCurrencyListState {
  final List<CriptoCurrency> criptocurrencies;
  const CriptocurrencyLoadedState(this.criptocurrencies)
      : super(existCriptoCurrency: true, listCriptoCurrency: criptocurrencies);
}

class CriptocurrencyErrorState extends CriptoCurrencyListState {
  final String error;
  const CriptocurrencyErrorState(this.error)
      : super(existCriptoCurrency: false, listCriptoCurrency: null);
}
