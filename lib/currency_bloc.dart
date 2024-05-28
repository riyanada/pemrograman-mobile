import 'package:flutter_bloc/flutter_bloc.dart';
import 'currency_event.dart';
import 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<ConvertCurrency>((event, emit) {
      if (event.amount <= 0) {
        emit(const CurrencyError('Masukkan nilai Rupiah yang valid'));
        return;
      }

      double result;
      String currency;

      switch (event.currencyType) {
        case 1:
          result = event.amount / 15956;
          currency = "USD";
          break;
        case 2:
          result = event.amount / 17332;
          currency = "EURO";
          break;
        case 3:
          result = event.amount / 3300;
          currency = "RINGGIT";
          break;
        case 4:
          result = event.amount / 130;
          currency = "YEN";
          break;
        default:
          emit(const CurrencyError('Pilih jenis konversi yang valid'));
          return;
      }

      emit(CurrencyConversionResult(
          double.parse(result.toStringAsFixed(2)), currency));
    });
  }
}
