part of 'cripto_currency_list_bloc.dart';

class CriptoCurrencyListState extends Equatable {
  final bool isLoading;
  final List<CriptoCurrency>? listCriptoCurrency;
  final String? httpError;

  const CriptoCurrencyListState({
    this.isLoading = false,
    this.listCriptoCurrency,
    this.httpError,
  });

  CriptoCurrencyListState copyWith(
      {bool? isLoading,
      List<CriptoCurrency>? listCriptoCurrency,
      String? httpError}) {
    return CriptoCurrencyListState(
      isLoading: isLoading ?? this.isLoading,
      listCriptoCurrency: listCriptoCurrency ?? this.listCriptoCurrency,
      httpError: httpError ?? this.httpError,
    );
  }

  @override
  List<Object?> get props => [isLoading, listCriptoCurrency, httpError];
}
