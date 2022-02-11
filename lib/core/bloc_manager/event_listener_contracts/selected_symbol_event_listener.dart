


import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Interface for blocs that need  current selected active symbol.
abstract class SelectedSymbolEventListener implements BaseEventListener {
  /// On active symbol selection change event handler.
  void onActiveSymbolsSelected(final ActiveSymbol selectedSymbol);
}
