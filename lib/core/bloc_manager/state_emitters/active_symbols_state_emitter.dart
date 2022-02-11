import 'package:drive_poc/core/bloc_manager/event_listener_contracts/active_symbol_event_listener.dart';
import 'package:drive_poc/core/states/active_symbol/active_symbols_cubit.dart';
import 'package:drive_poc/core/states/active_symbol/active_symbols_state.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

/// ActiveSymbols state emitter.
class ActiveSymbolsStateEmitter extends BaseStateEmitter<
    ActiveSymbolsEventListener,
    ActiveSymbolCubit>{

  /// Initializes ActiveSymbols state emitter.
  ActiveSymbolsStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({required ActiveSymbolsEventListener eventListener,
    required Object state}) {
    if (state is ActiveSymbolLoadedState) {
      eventListener.onActiveSymbolsLoaded(state.activeSymbols);
    } else if (state is ActiveSymbolLoadingState) {
      eventListener.onActiveSymbolsLoading();
    } else if (state is ActiveSymbolErrorState) {
      eventListener.onActiveSymbolsError(state.errorMessage);
    }
  }
}