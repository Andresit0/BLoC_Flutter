import 'package:bloc_template/bloc/cripto_currency_list/cripto_currency_list_bloc.dart';
import 'package:bloc_template/view/widget/label.dart';
import 'package:bloc_template/view/widget/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../globalVariables/constant/color.dart';
import '../../model/cripto_currency.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget criptoCurrencyList() {
    return BlocBuilder<CriptoCurrencyListBloc, CriptoCurrencyListState>(
        builder: ((context, state) {
      if (state is CriptoCurrencyInitialState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CriptocurrencyLoadedState) {
        List<CriptoCurrency> criptoCurrrencies = state.criptocurrencies;
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: header(
                    text: 'CRYPTOCURRENCY',
                  )),
              SingleChildScrollView(
                child: Column(
                  children: [
                    table(
                      titleColumn: ['NAME', 'SYMBOL', 'PRICE'],
                      bodyColumn: [
                        criptoCurrrencies.map((e) => e.name).toList(),
                        criptoCurrrencies
                            .map((e) => e.symbol.toUpperCase())
                            .toList(),
                        criptoCurrrencies
                            .map((e) => e.price.toString())
                            .toList(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else if (state is CriptocurrencyErrorState) {
        return Center(
          child: Text('ERROR: ${state.error}'),
        );
      } else {
        return Container();
      }
    }));
  }

  void updateCriptoCurrencyList(BuildContext context) async {
    while (true) {
      await Future.delayed(const Duration(minutes: 60)).then((value) async {
        BlocProvider.of<CriptoCurrencyListBloc>(context, listen: false)
            .add(CriptocurrencyLoadingEvent());
        return;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    updateCriptoCurrencyList(context);
    return Scaffold(
      backgroundColor: colorAppBackground,
      body: criptoCurrencyList(),
    );
  }
}
