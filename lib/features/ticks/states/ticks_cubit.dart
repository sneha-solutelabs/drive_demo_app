import 'package:bloc/bloc.dart';
import 'package:drive_poc/core/bloc_manager/event_listener_contracts/selected_symbol_event_listener.dart';
import 'package:drive_poc/features/ticks/states/ticks_state.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

///Ticks cubit for managing ticks state.
class TicksCubit extends Cubit<TicksState>
    implements SelectedSymbolEventListener {
  /// Initializes ticks state.
  TicksCubit() : super(TicksLoadingState());

  ///subscribe ticks
  Future<void> subscribeTicks({required ActiveSymbol selectedSymbol}) async {
    try {
      emit(TicksLoadingState());

      await _unsubscribeTick();

      _subscribeTick(selectedSymbol)
          .listen((Tick? tick) {
        emit (TicksLoaded(tick: tick));
      });

    } on Exception catch (e) {
      emit(TicksError('$e'));
    }
  }


  Stream<Tick?> _subscribeTick(ActiveSymbol selectedSymbol) =>
      Tick.subscribeTick(
        TicksRequest(ticks: selectedSymbol.symbol),
      );

  Future<ForgetAll> _unsubscribeTick() => Tick.unsubscribeAllTicks();

  @override
  void onActiveSymbolsSelected(ActiveSymbol selectedSymbol) {
    subscribeTicks(selectedSymbol: selectedSymbol);
  }

}