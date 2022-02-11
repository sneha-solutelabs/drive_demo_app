

import 'package:flutter_deriv_api/api/common/tick/tick.dart';

///Base state of Tick state
abstract class TicksState {}
///Loading state for ticks
class TicksLoadingState extends TicksState {}
///Loaded state for ticks
class TicksLoaded extends TicksState {
  ///initialize
  TicksLoaded({
    this.tick,
  });

  ///tick object
  final Tick? tick;

}

/// Error state for ticks
class TicksError extends TicksState {
  ///Initialize
  TicksError(this.errorMessage);
  ///Error message
  final String errorMessage;
}



