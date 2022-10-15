import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../globalVariables/dynamic/list.dart';
import '../../model/cripto_currency.dart';
import '../../repository/repositories.dart';

part 'cripto_currency_list_event.dart';
part 'cripto_currency_list_state.dart';

class CriptoCurrencyListBloc
    extends Bloc<CriptoCurrencyListEvent, CriptoCurrencyListState> {
  CriptoCurrencyListBloc() : super(const CriptoCurrencyInitialState()) {
    on<CriptocurrencyLoadingEvent>((event, emit) async {
      CriptoCurrencyRespository criptoCurrencyRespository =
          CriptoCurrencyRespository();
      List<CriptoCurrency> listCriptocurrency = [];

      try {
        for (String criptoCurrency in criptocurrencies) {
          listCriptocurrency.add(
              await criptoCurrencyRespository.getCritocurrency(criptoCurrency));
        }
      } catch (e) {
        emit(CriptocurrencyErrorState(e.toString()));
        throw Exception(
            "ERROR: CriptocurrencyLoadingEvent lib/bloc/cripto_currency_list/cripto_currency_list_bloc.dart: $e");
      }

      if (!listEquals(state.listCriptoCurrency, listCriptocurrency)) {
        emit(CriptoCurrencySetState(listCriptocurrency));
        emit(CriptocurrencyLoadedState(listCriptocurrency));
      }
    });
  }
}
