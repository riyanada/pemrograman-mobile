import 'package:equatable/equatable.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class ConvertCurrency extends CurrencyEvent {
  final double amount;
  final int currencyType;

  const ConvertCurrency(this.amount, this.currencyType);

  @override
  List<Object> get props => [amount, currencyType];
}
