import 'package:equatable/equatable.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class CurrencyConversionResult extends CurrencyState {
  final double result;
  final String currency;

  const CurrencyConversionResult(this.result, this.currency);

  @override
  List<Object> get props => [result, currency];
}

class CurrencyError extends CurrencyState {
  final String message;

  const CurrencyError(this.message);

  @override
  List<Object> get props => [message];
}
