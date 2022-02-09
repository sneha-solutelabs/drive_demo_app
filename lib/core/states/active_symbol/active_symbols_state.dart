import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

// part of 'active_symbol_cubit.dart';

abstract class ActiveSymbolState {}

class ActiveSymbolInitialState extends ActiveSymbolState {}

class ActiveSymbolLoadingState extends ActiveSymbolState {}

class ActiveSymbolLoadedState extends ActiveSymbolState {
  /// Initializes
  ActiveSymbolLoadedState({
    this.activeSymbols,
  });

  /// Active symbols
  final List<ActiveSymbol>? activeSymbols;

}

class ActiveSymbolErrorState extends ActiveSymbolState {
  /// Initializes
  ActiveSymbolErrorState(this.errorMessage);

  /// Error message
  final String errorMessage;
}
