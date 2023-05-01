import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../globalVariables/dynamic/list.dart';
import '../../model/cripto_currency.dart';
import '../../repository/repositories.dart';

part 'cripto_currency_list_event.dart';
part 'cripto_currency_list_state.dart';

class CriptoCurrencyListBloc
    extends Bloc<CriptoCurrencyListEvent, CriptoCurrencyListState> {
  CriptoCurrencyListBloc()
      : super(const CriptoCurrencyListState(isLoading: true)) {
    on<CriptocurrenciesLoad>(_criptoCurrencyLoad);
  }
  _criptoCurrencyLoad(
      CriptocurrenciesLoad event, Emitter<CriptoCurrencyListState> emit) async {
    CriptoCurrencyRespository criptoCurrencyRespository =
        CriptoCurrencyRespository();
    List<CriptoCurrency> listCriptocurrency = [];

    try {
      listCriptocurrency =
          await criptoCurrencyRespository.getCriptocurrencies(criptocurrencies);
    } catch (e, stacktrace) {
      emit(state.copyWith(httpError: e.toString(), isLoading: false));
      throw Exception("ERROR:\n$e\n$stacktrace");
    }

    if (state !=
        state.copyWith(
            listCriptoCurrency: listCriptocurrency, isLoading: false)) {
      emit(state.copyWith(
          listCriptoCurrency: listCriptocurrency, isLoading: false));
    }
  }

  void loadCriptocurrencies() => add(CriptocurrenciesLoad());
}
