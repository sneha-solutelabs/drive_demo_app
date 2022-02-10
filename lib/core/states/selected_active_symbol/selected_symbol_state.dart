
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

abstract class SelectedSymbolState {}

class SelectedSymbolInitialState extends SelectedSymbolState {}

class SelectSymbolChangeState extends SelectedSymbolState {
  SelectSymbolChangeState({
    required this.selectedActiveSymbol
  });
  final ActiveSymbol selectedActiveSymbol;
}
