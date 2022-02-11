import 'package:drive_poc/core/bloc_manager/event_listener_contracts/selected_symbol_event_listener.dart';
import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_cubit.dart';
import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_state.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Select symbols state emitter.
class SelectSymbolsStateEmitter extends
BaseStateEmitter<SelectedSymbolEventListener,SelectSymbolCubit>{
  /// Initializes Select symbols state emitter.
  SelectSymbolsStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({required SelectedSymbolEventListener eventListener,
    required Object state}) {
    if (state is SelectSymbolChangeState) {
      eventListener.onActiveSymbolsSelected(state.selectedActiveSymbol);
    }
  }
}