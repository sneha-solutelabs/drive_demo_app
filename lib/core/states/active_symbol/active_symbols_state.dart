import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

abstract class ActiveSymbolState {}

class ActiveSymbolInitialState extends ActiveSymbolState {}

class ActiveSymbolLoadingState extends ActiveSymbolState {}

class ActiveSymbolLoadedState extends ActiveSymbolState {
  ActiveSymbolLoadedState({
    required this.activeSymbols,
  });
  final List<ActiveSymbol> activeSymbols;
}

class ActiveSymbolErrorState extends ActiveSymbolState {
  ActiveSymbolErrorState(this.errorMessage);

  final String errorMessage;
}
