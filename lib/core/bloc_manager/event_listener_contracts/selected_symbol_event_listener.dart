


import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

abstract class SelectedSymbolEventListener implements BaseEventListener {
  void onActiveSymbolsSelected(final ActiveSymbol selectedSymbol);
}
