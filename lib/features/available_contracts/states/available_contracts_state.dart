import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';

abstract class AvailableContractsState {}

class AvailableContractsLoading extends AvailableContractsState {}

class AvailableContractsError extends AvailableContractsState {
  /// Initializes
  AvailableContractsError(this.errorMessage);

  /// Error message
  final String errorMessage;
}

class AvailableContractsLoaded extends AvailableContractsState {
  /// Initializes
  AvailableContractsLoaded({
    this.contracts,
  });

  /// Active symbols
  final ContractsForSymbol? contracts;

}